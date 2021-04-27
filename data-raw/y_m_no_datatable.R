## code to prepare `y_m_no_datatable` dataset goes here

file_path <- system.file("extdata", "y_m_no.csv",
                         package = "hawaiispiders")
y_m_no_datatable <- readr::read_delim(
  file_path,
  ";",
  escape_double = FALSE,
  trim_ws = TRUE
)

usethis::use_data(y_m_no_datatable, overwrite = TRUE)
