## code to prepare `a_m_max` dataset goes here

data("a_m_max_datatable")

a_m_max <- DAISIE::DAISIE_dataprep(
  a_m_max_datatable,
  island_age = 3.6,
  M = 168
)

usethis::use_data(a_m_max, overwrite = TRUE)
