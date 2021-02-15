## code to prepare `spider_scenario_2_2_1_datatable` dataset goes here

file_path <- system.file("extdata", "spider_scenario_2_2_1.csv",
                         package = "hawaiispiders")
spider_scenario_2_2_1_datatable <- readr::read_delim(
  file_path,
  ";",
  escape_double = FALSE,
  trim_ws = TRUE
)

usethis::use_data(spider_scenario_2_2_1_datatable, overwrite = TRUE)
