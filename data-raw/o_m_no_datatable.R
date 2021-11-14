## code to prepare `o_m_no_datatable` dataset goes here

file_path <- system.file("extdata", "o_m_no.csv",
  package = "hawaiispiders"
)

o_m_no_datatable <- readr::read_csv(file_path)

usethis::use_data(o_m_no_datatable, overwrite = TRUE)
