## code to prepare `spider_scenario_2_1_2_datalist` dataset goes here

data("spider_scenario_2_1_2_datatable")

spider_scenario_2_1_2_datalist <- DAISIE::DAISIE_dataprep(
  spider_scenario_2_1_2_datatable,
  island_age = 1.2,
  M = 165
)

usethis::use_data(spider_scenario_2_1_2_datalist, overwrite = TRUE)
