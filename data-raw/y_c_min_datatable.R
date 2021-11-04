## code to prepare `y_c_min_datatable` dataset goes here

file_path <- system.file("extdata", "y_c_min.csv",
  package = "hawaiispiders"
)
y_c_min_datatable <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(y_c_min_datatable, overwrite = TRUE)
