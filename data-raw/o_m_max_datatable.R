## code to prepare `o_m_max_datatable` dataset goes here

file_path <- system.file("extdata", "o_m_max.csv",
  package = "hawaiispiders"
)
o_m_max_datatable <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(o_m_max_datatable, overwrite = TRUE)
