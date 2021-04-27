## code to prepare `o_m_no` dataset goes here

data("o_m_no_datatable")

o_m_no <- DAISIE::DAISIE_dataprep(
  o_m_no_datatable,
  island_age = 2.4,
  M = 165
)

usethis::use_data(o_m_no, overwrite = TRUE)
