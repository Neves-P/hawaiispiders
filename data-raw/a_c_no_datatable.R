## code to prepare `a_c_no_datatable` dataset goes here

file_path <- system.file("extdata", "a_c_no.csv",
  package = "hawaiispiders"
)
a_c_no_datatable <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(a_c_no_datatable, overwrite = TRUE)
