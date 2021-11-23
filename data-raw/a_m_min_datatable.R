## code to prepare `a_m_min_datatable` dataset goes here

file_path <- system.file("extdata", "a_m_min.csv",
  package = "hawaiispiders"
)
a_m_min_datatable <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(a_m_min_datatable, overwrite = TRUE)
