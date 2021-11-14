## code to prepare `y_m_no` dataset goes here

data("y_m_no_datatable")

y_m_no <- DAISIE::DAISIE_dataprep(
  y_m_no_datatable,
  island_age = 1.2,
  M = 168
)

usethis::use_data(y_m_no, overwrite = TRUE)
