## code to prepare `y_m_min_datatable` dataset goes here

file_path <- system.file("extdata", "y_m_min.csv",
  package = "hawaiispiders"
)
y_m_min_datatable <- readr::read_delim(
  file_path,
  ";",
  escape_double = FALSE,
  trim_ws = TRUE
)

usethis::use_data(y_m_min_datatable, overwrite = TRUE)
