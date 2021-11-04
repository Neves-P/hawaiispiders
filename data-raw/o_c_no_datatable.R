## code to prepare `o_c_no_datatable` dataset goes here

file_path <- system.file("extdata", "o_c_no.csv",
  package = "hawaiispiders"
)
o_c_no_datatable <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(o_c_no_datatable, overwrite = TRUE)
