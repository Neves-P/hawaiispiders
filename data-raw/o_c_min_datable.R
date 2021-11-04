## code to prepare `o_c_min_datable` dataset goes here

file_path <- system.file("extdata", "o_c_min.csv",
  package = "hawaiispiders"
)
o_c_min_datable <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(o_c_min_datable, overwrite = TRUE)
