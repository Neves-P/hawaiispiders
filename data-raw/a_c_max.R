## code to prepare `a_c_max` dataset goes here

data("a_c_max_datatable")

a_c_max <- DAISIE::DAISIE_dataprep(
  a_c_max_datatable,
  island_age = 3.6,
  M = 168
)

usethis::use_data(a_c_max, overwrite = TRUE)
