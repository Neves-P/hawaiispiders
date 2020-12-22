## code to prepare `spider_scenario_1_datalist` dataset goes here

data("spider_scenario_1_datatable")

spider_scenario_1_datalist <- DAISIE::DAISIE_dataprep(
  spider_scenario_1_datatable,
  island_age = 1.2,
  M = 165
)

usethis::use_data(spider_scenario_1_datalist, overwrite = TRUE)
