## code to prepare `spider_scenario_2_2_1_datalist` dataset goes here

data("spider_scenario_2_2_1_datatable")

spider_scenario_2_2_1_datalist <- DAISIE::DAISIE_dataprep(
  spider_scenario_2_2_1_datatable,
  island_age = 2.4,
  M = 165
)

usethis::use_data(spider_scenario_2_2_1_datalist, overwrite = TRUE)
