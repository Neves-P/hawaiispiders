## code to prepare `a_c_min_datable` dataset goes here

file_path <- system.file("extdata", "a_c_min.csv",
  package = "hawaiispiders"
)
a_c_min_datable <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(a_c_min_datable, overwrite = TRUE)
