use {{ param.hive_schema }};

CREATE TABLE IF NOT EXISTS
ib_ce_s(
cp_id string,
cp_name string,
rating_id string,
country_id string,
industry_id string,
division_id string,
current_exp decimal(10,2),
exposure1 decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
TBLPROPERTIES (
"skip.header.line.count"="1",
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
ib_pe_s(
cp_id string,
cp_name string,
rating_id string,
country_id string,
industry_id string,
division_id string,
potential_exp decimal(10,2),
exposure2 decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
TBLPROPERTIES ("skip.header.line.count"="1",
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
pb_ce_s(
cif_id string,
cif_name string,
cp_id string,
cp_name string,
rating_id string,
country_id string,
industry_id string,
division_id string,
current_exp decimal(10,2),
exposure1 decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1",
'serialization.null.format'='');


CREATE TABLE IF NOT EXISTS
pb_pe_s(
cif_id string,
cif_name string,
cp_id string,
cp_name string,
rating_id string,
country_id string,
industry_id string,
division_id string,
potential_exp decimal(10,2),
exposure2 decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES ("skip.header.line.count"="1",
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
division_ref_s(
divisionid string,
divisionname string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
TBLPROPERTIES ("skip.header.line.count"="1",
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
country_ref_s(
countryid string,
countryname string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
TBLPROPERTIES (
"skip.header.line.count"="1",
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
industry_ref_s(
industry_id string,
industry_name string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
TBLPROPERTIES (
"skip.header.line.count"="1",
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
rating_ref_s(
rating_id string,
rating_name string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '|'
TBLPROPERTIES (
"skip.header.line.count"="1",
'serialization.null.format'='');


CREATE TABLE IF NOT EXISTS
IB_CE_T(
cp_id string,
cp_name string,
rating_id string,
country_id string,
industry_id string,
division_id string,
current_exp decimal(10,2),
exposure1 decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
IB_PE_T(
cp_id string,
cp_name string,
rating_id string,
country_id string,
industry_id string,
division_id string,
potential_exp decimal(10,2),
exposure2 decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
PB_CE_T(
cif_id string,
cif_name string,
cp_id string,
cp_name string,
rating_id string,
country_id string,
industry_id string,
division_id string,
current_exp decimal(10,2),
exposure1 decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
PB_PE_T(
cif_id string,
cif_name string,
cp_id string,
cp_name string,
rating_id string,
country_id string,
industry_id string,
division_id string,
potential_exp decimal(10,2),
exposure2 decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
division_ref_t(
divisionid string,
divisionname string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
country_ref_t(
countryid string,
countryname string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
industry_ref_t(
industry_id string,
industry_name string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
rating_ref_t(
rating_id string,
rating_name string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
cr_harmonized_pb(
cp_id string,
cp_name string,
rating_id string,
rating_name string,
country_id string,
conutry_name string,
industry_id string,
industry_name string,
division_id string,
division_name string,
system_type string,
current_exposure decimal(10,2),
exposure1 decimal(10,2),
potential_exposure decimal(10,2),
exposure2 decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
cr_harmonized_ib(
cp_id string,
cp_name string,
rating_id string,
rating_name string,
country_id string,
conutry_name string,
industry_id string,
industry_name string,
division_id string,
division_name string,
system_type string,
current_exposure decimal(10,2),
exposure1 decimal(10,2),
potential_exposure decimal(10,2),
exposure2 decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE TABLE IF NOT EXISTS
cr_aggr(
cp_id string,
cp_name string,
rating_id string,
rating_name string,
country_id string,
conutry_name string,
industry_id string,
industry_name string,
division_id string,
division_name string,
system_type string,
current_exposure decimal(10,2),
exposure1 decimal(10,2),
potential_exposure decimal(10,2),
exposure2 decimal(10,2),
LME decimal(10,2))
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
TBLPROPERTIES(
'serialization.null.format'='');

CREATE EXTERNAL TABLE IF NOT EXISTS Summary_Report( division string,current_exposure double ,potential_exposure double,exposure1 double, exposure2 double, LME double) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE LOCATION '{{ params.output_path }}/Summary_Report'
TBLPROPERTIES(
'serialization.null.format'='');

CREATE EXTERNAL TABLE IF NOT EXISTS List_report(counterparty string,current_exposure double, potential_exposure double, country string,rating string,industry string) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE LOCATION '{{ params.output_path }}/List_report'
TBLPROPERTIES(
'serialization.null.format'='');