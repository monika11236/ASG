use {{ params.hive_schema }};

INSERT OVERWRITE TABLE Summary_Report SELECT division_name,sum(current_exposure),sum(potential_exposure),sum(exposure1),sum(exposure2),sum(LME) FROM cr_aggr group by division_name;

INSERT OVERWRITE TABLE List_report SELECT cp_id,sum(current_exposure),sum(potential_exposure),conutry_name,rating_name,industry_name FROM cr_aggr group by cp_id,conutry_name,rating_name,industry_name;