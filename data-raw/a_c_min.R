## code to prepare `a_c_min` dataset goes here

data("a_c_min_datable")

a_c_min <- DAISIE::DAISIE_dataprep(
  a_c_min_datable,
  island_age = 3.6,
  M = 168
)

usethis::use_data(a_c_min, overwrite = TRUE)
