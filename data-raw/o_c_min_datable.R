## code to prepare `o_c_min_datable` dataset goes here

file_path <- system.file("extdata", "spider_scenario_1_2_2.csv",
                         package = "hawaiispiders")
o_c_min_datable <- readr::read_delim(
  file_path,
  ";",
  escape_double = FALSE,
  trim_ws = TRUE
)

usethis::use_data(o_c_min_datable, overwrite = TRUE)
