test_that("multiplication works", {
  skip_if(Sys.getenv("CI") == "", message = "Run only on CI")

  datalist_name <- "spider_scenario_1_1_1_datalist"
  M <- 165
  model <- 1
  seed <- 1
  file_path <- create_output_folder(output_name = datalist_name, model = model)

  run_main(
    datalist_name = datalist_name,
    M = M,
    model = model,
    seed_range = seed
  )

  spider_scenario_1_1_1_datalist_m_1 <- read.delim(file_path, header = TRUE)

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
  colnames(expected_data_frame) <- c(
    "datalist_name",
    "model",
    "seed",
    "island_age",
    "M",
    "type",
    "p_type2",
    "res",
    "methode",
    "run_number",
    "lambda_c",
    "mu",
    "K",
    "gamma",
    "lambda_a",
    "loglik",
    "df",
    "conv",
    "initparsopt_lac",
    "initparsopt_mu",
    "initparsopt_K",
    "initparsopt_gamma",
    "initparsopt_laa"
  )
  expect_equal(expected_data_frame, spider_scenario_1_1_1_datalist_m_1[1, ],
               tolerance = 1e-6)
  # Clean-up
  expect_equal(unlink("results", recursive = TRUE), 0)
})
