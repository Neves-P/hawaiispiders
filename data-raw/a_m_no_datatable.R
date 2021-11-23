## code to prepare `a_m_no_datatable` dataset goes here

file_path <- system.file("extdata", "a_m_no.csv",
  package = "hawaiispiders"
)

a_m_no_datatable <- readr::read_csv(file_path)

usethis::use_data(a_m_no_datatable, overwrite = TRUE)
