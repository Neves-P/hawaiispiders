## code to prepare `y_c_max` dataset goes here

data("y_c_max_datatable")

y_c_max <- DAISIE::DAISIE_dataprep(
  y_c_max_datatable,
  island_age = 1.2,
  M = 168
)

usethis::use_data(y_c_max, overwrite = TRUE)
