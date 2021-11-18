## code to prepare `y_c_no_datatable` dataset goes here

file_path <- system.file("extdata", "y_c_no.csv",
  package = "hawaiispiders"
)
y_c_no_datatable <- readr::read_csv(file_path)

usethis::use_data(y_c_no_datatable, overwrite = TRUE)
