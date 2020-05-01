use {{ params.hive_schema }};

LOAD DATA LOCAL INPATH '{{ params.input_path }}/Division_Ref.txt' OVERWRITE INTO TABLE division_ref_s ;
LOAD DATA LOCAL INPATH '{{ params.input_path }}/Country_Ref.txt' OVERWRITE INTO TABLE country_ref_s ;
LOAD DATA LOCAL INPATH '{{ params.input_path }}/Industry_Ref.txt' OVERWRITE INTO TABLE industry_ref_s ;
LOAD DATA LOCAL INPATH '{{ params.input_path }}/Rating_Ref.txt' OVERWRITE INTO TABLE rating_ref_s ;
LOAD DATA LOCAL INPATH '{{ params.input_path }}/IB_CE.txt' OVERWRITE INTO TABLE ib_ce_s ;
LOAD DATA LOCAL INPATH '{{ params.input_path }}/IB_PE.txt' OVERWRITE INTO TABLE ib_pe_s ;
LOAD DATA LOCAL INPATH '{{ params.input_path }}/PB_CE.csv' OVERWRITE INTO TABLE pb_ce_s ;
LOAD DATA LOCAL INPATH '{{ params.input_path }}/PB_PE.csv' OVERWRITE INTO TABLE pb_pe_s ;


TRUNCATE TABLE division_ref_t;
TRUNCATE TABLE country_ref_t;
TRUNCATE TABLE industry_ref_t;
TRUNCATE TABLE rating_ref_t;
TRUNCATE TABLE IB_CE_T;
TRUNCATE TABLE IB_PE_T;
TRUNCATE TABLE PB_CE_T;
TRUNCATE TABLE PB_PE_T;

INSERT INTO TABLE division_ref_t SELECT * FROM division_ref_s WHERE divisionid IS NOT NULL;
INSERT INTO TABLE country_ref_t SELECT * FROM country_ref_s WHERE countryid IS NOT NULL; 
INSERT INTO TABLE industry_ref_t SELECT * FROM industry_ref_s WHERE industry_id IS NOT NULL;
INSERT INTO TABLE rating_ref_t SELECT * FROM rating_ref_s WHERE rating_id IS NOT NULL;
INSERT INTO TABLE IB_CE_T SELECT * FROM ib_ce_s WHERE exposure1 IS NOT NULL and current_exp is not null;
INSERT INTO TABLE IB_PE_T SELECT * FROM ib_pe_s WHERE exposure2 IS NOT NULL and potential_exp is not null;
INSERT INTO TABLE PB_CE_T SELECT * FROM pb_ce_s WHERE exposure1 IS NOT NULL and current_exp is not null;
INSERT INTO TABLE PB_PE_T SELECT * FROM pb_pe_s WHERE exposure2 IS NOT NULL and potential_exp is not null;