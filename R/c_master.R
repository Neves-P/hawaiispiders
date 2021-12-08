## code to prepare `c_master` dataset goes here

file_path <- system.file("extdata", "c_master.csv",
                         package = "hawaiispiders")
c_master <- readr::read_csv(file_path, trim_ws = TRUE)

usethis::use_data(c_master, overwrite = TRUE)

