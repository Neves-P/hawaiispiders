## code to prepare `y_m_max_datatable` dataset goes here

file_path <- system.file("extdata", "spider_scenario_2_1_1.csv",
                         package = "hawaiispiders")
y_m_max_datatable <- readr::read_delim(
  file_path,
  ";",
  escape_double = FALSE,
  trim_ws = TRUE
)

usethis::use_data(y_m_max_datatable, overwrite = TRUE)
