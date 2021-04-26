## code to prepare `y_m_min` dataset goes here

data("y_m_min_datatable")

y_m_min <- DAISIE::DAISIE_dataprep(
  y_m_min_datatable,
  island_age = 1.2,
  M = 165
)

usethis::use_data(y_m_min, overwrite = TRUE)
