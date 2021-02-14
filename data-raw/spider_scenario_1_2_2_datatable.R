## code to prepare `spider_scenario_1_2_2_datatable` dataset goes here

file_path <- system.file("extdata", "spider_scenario_1_2_2.csv",
                         package = "hawaiispiders")
spider_scenario_1_2_2_datatable <- readr::read_delim(
  file_path,
  ";",
  escape_double = FALSE,
  trim_ws = TRUE
)

usethis::use_data(spider_scenario_1_2_2_datatable, overwrite = TRUE)
