#--------------------------------------------------------------------------------
 #Load The Dependencies
 #--------------------------------------------------------------------------------


import io
import os
import re
import csv
import subprocess
from subprocess import Popen, PIPE

import yaml

import airflow
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.hive_operator import HiveOperator
from airflow.operators.python_operator import PythonOperator
from datetime import datetime

import logging

#--------------------------------------------------------------------------------
# Set Defaults
#--------------------------------------------------------------------------------

CONFIG_FILE = 'config.yaml'

def read_config():
    with open('/home/cloudera/airflow/dags/config.yaml','r') as stream:
        return (yaml.safe_load(stream))
 
config = read_config()

default_args = {'owner': 'root','start_date': datetime(2015, 12, 1)}

with DAG(dag_id=config['dag_id'],default_args=default_args,schedule_interval=None,) as dag:

	create_tables = HiveOperator(hql='/hive_task/create_table.hql',hive_cli_conn_id=config['hive_connection'],schema= config['hive_schema'],task_id='create_tables',params = { 'hive_schema': config['hive_schema'], 'output_path': config['output_path']},dag=dag)

	load_data_in_hive = HiveOperator(hql='/hive_task/tableload.hql',hive_cli_conn_id=config['hive_connection'],schema= config['hive_schema'],task_id='load_data_in_hive',params = { 'hive_schema': config['hive_schema'], 'input_path': config['input_path']},dag=dag)

	create_tables >> load_data_in_hive

	create_harmonized = HiveOperator(hql='/hive_task/dataharmonization.hql',hive_cli_conn_id=config['hive_connection'],schema= config['hive_schema'],hiveconf_jinja_translate=True,task_id='create_harmonized',params = { 'hive_schema': config['hive_schema']},dag=dag)

	load_data_in_hive >> create_harmonized	

	create_aggregate = HiveOperator(hql='/hive_task/dataggregation.hql',hive_cli_conn_id=config['hive_connection'],schema= config['hive_schema'],hiveconf_jinja_translate=True,task_id='create_aggregate',params = { 'hive_schema': config['hive_schema']},dag=dag)

	create_harmonized >> create_aggregate

	create_reports = HiveOperator(hql='/hive_task/summary&reports.hql',hive_cli_conn_id=config['hive_connection'],schema= config['hive_schema'],hiveconf_jinja_translate=True,task_id='create_reports',params = { 'hive_schema': config['hive_schema']},dag=dag)

	create_aggregate >> create_reports
