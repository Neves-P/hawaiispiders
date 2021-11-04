## code to prepare `o_c_min` dataset goes here

data("o_c_min_datable")

o_c_min <- DAISIE::DAISIE_dataprep(
  o_c_min_datable,
  island_age = 2.4,
  M = 168
)

usethis::use_data(o_c_min, overwrite = TRUE)
