## code to prepare `a_m_no` dataset goes here

data("a_m_no_datatable")

a_m_no <- DAISIE::DAISIE_dataprep(
  a_m_no_datatable,
  island_age = 3.6,
  M = 168
)

usethis::use_data(a_m_no, overwrite = TRUE)
