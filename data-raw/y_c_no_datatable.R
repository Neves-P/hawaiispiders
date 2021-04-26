## code to prepare `y_c_no_datatable` dataset goes here

file_path <- system.file("extdata", "spider_scenario_1_1_3.csv",
                         package = "hawaiispiders")
y_c_no_datatable <- readr::read_delim(
  file_path,
  ";",
  escape_double = FALSE,
  trim_ws = TRUE
)

usethis::use_data(y_c_no_datatable, overwrite = TRUE)
