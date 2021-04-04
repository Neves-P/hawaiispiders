## code to prepare `spider_scenario_1_1_3_datalist` dataset goes here

data("spider_scenario_1_1_3_datatable")

spider_scenario_1_1_3_datalist <- DAISIE::DAISIE_dataprep(
  spider_scenario_1_1_3_datatable,
  island_age = 1.2,
  M = 165
)

usethis::use_data(spider_scenario_1_1_3_datalist, overwrite = TRUE)
