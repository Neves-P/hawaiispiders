## code to prepare `m_master` dataset goes here

file_path <- system.file("extdata", "m_master.csv",
                         package = "hawaiispiders")
m_master <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(m_master, overwrite = TRUE)

