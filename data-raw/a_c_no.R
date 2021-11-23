## code to prepare `a_c_no` dataset goes here

data("a_c_no_datatable")

a_c_no <- DAISIE::DAISIE_dataprep(
  a_c_no_datatable,
  island_age = 3.6,
  M = 168
)

usethis::use_data(a_c_no, overwrite = TRUE)
