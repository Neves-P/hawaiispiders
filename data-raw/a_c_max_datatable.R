## code to prepare `a_c_max_datatable` dataset goes here

file_path <- system.file("extdata", "a_c_max.csv",
  package = "hawaiispiders"
)
a_c_max_datatable <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(a_c_max_datatable, overwrite = TRUE)

