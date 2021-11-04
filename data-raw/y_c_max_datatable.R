## code to prepare `y_c_max_datatable` dataset goes here

file_path <- system.file("extdata", "y_c_max.csv",
  package = "hawaiispiders"
)
y_c_max_datatable <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(y_c_max_datatable, overwrite = TRUE)
