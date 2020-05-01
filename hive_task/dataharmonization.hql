use {{ params.hive_schema }};

INSERT OVERWRITE TABLE cr_harmonized_pb 
SELECT cp_id,
cp_name,
PB_PE_T.rating_id,
rating_name,
PB_PE_T.country_id,
countryname,
PB_PE_T.industry_id,
industry_name,
PB_PE_T.division_id,
divisionname,
"PB" AS system_type,
0 as current_exp,
0 as exposure1,
potential_exp,
exposure2 FROM PB_PE_T 
LEFT JOIN country_ref_t ON 
PB_PE_T.country_id = country_ref_t.countryid 
LEFT JOIN industry_ref_t ON 
PB_PE_T.industry_id = industry_ref_t.industry_id 
LEFT JOIN division_ref_t ON 
PB_PE_T.division_id = division_ref_t.divisionid 
LEFT JOIN rating_ref_t ON 
PB_PE_T.rating_id = rating_ref_t.rating_id 
union all 
SELECT  cp_id,
cp_name,
PB_CE_T.rating_id,
rating_name,
PB_CE_T.country_id,
countryname,
PB_CE_T.industry_id,
industry_name,
PB_CE_T.division_id,
divisionname,
"PB" AS system_type,
current_exp,
exposure1,
 0 as potential_exp,
0 as exposure2 
FROM PB_CE_T 
LEFT JOIN country_ref_t ON 
PB_CE_T.country_id = country_ref_t.countryid 
LEFT JOIN industry_ref_t ON 
PB_CE_T.industry_id = industry_ref_t.industry_id 
LEFT JOIN division_ref_t ON 
PB_CE_T.division_id = division_ref_t.divisionid 
LEFT JOIN rating_ref_t ON 
PB_CE_T.rating_id = rating_ref_t.rating_id;


INSERT OVERWRITE TABLE cr_harmonized_ib SELECT cp_id,
cp_name,
IB_PE_T.rating_id,
rating_name,
IB_PE_T.country_id,
countryname,
IB_PE_T.industry_id,
industry_name,
IB_PE_T.division_id,
divisionname,
"IB" AS system_type,
0 as current_exp,
0 as exposure1,
potential_exp,
exposure2 
FROM IB_PE_T 
LEFT JOIN country_ref_t ON 
IB_PE_T.country_id = country_ref_t.countryid 
LEFT JOIN industry_ref_t ON 
IB_PE_T.industry_id = industry_ref_t.industry_id 
LEFT JOIN division_ref_t 
ON IB_PE_T.division_id = division_ref_t.divisionid 
LEFT JOIN rating_ref_t 
ON IB_PE_T.rating_id = rating_ref_t.rating_id 
union all 
SELECT cp_id,
cp_name,
IB_CE_T.rating_id,
rating_name,
IB_CE_T.country_id,
countryname,
IB_CE_T.industry_id,
industry_name,
IB_CE_T.division_id,
divisionname,
"IB" AS system_type,
current_exp,
exposure1,
0 as potential_exp,
0 as exposure2 
FROM IB_CE_T 
LEFT JOIN country_ref_t ON 
IB_CE_T.country_id = country_ref_t.countryid 
LEFT JOIN industry_ref_t ON 
IB_CE_T.industry_id = industry_ref_t.industry_id 
LEFT JOIN division_ref_t ON 
IB_CE_T.division_id = division_ref_t.divisionid 
LEFT JOIN rating_ref_t ON 
IB_CE_T.rating_id = rating_ref_t.rating_id;