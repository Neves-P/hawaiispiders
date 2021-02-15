test_that("multiplication works", {
  datalist_name <- "spider_scenario_1_1_1_datalist"
  M <- 165
  model <- 1
  seed <- 1

  file_path <- create_output_folder(output_name = datalist_name, model = model)

  run_spider_analysis(
    datalist_name = datalist_name,
    M = M,
    model = model,
    seed = seed,
    file_path = file_path
  )
  spider_scenario_1_1_1_datalist_m_1 <- read.delim(file_path, header = FALSE)
  column_names <- colnames(spider_scenario_1_1_1_datalist_m_1[1, ])

  expected_data_frame <- data.frame(
    "spider_scenario_1_1_1_datalist",
    1,
    1,
    1.2,
    165,
    1,
    0,
    100,
    "lsodes",
    "R1",
    0.5084828,
    2.200510e-06,
    142548.4,
    0.1439979,
    0.9958697,
    -124.439,
    5,
    0,
    0.5310173,
    0.7442478,
    117.1336,
    9.082078e-05,
    0.8865595
  )
  colnames(expected_data_frame) <- column_names
  expect_equal(expected_data_frame, spider_scenario_1_1_1_datalist_m_1[1, ],
               tolerance = 1e-6)
  # Clean-up
  expect_equal(unlink("spiders", recursive = TRUE), 0)
})
