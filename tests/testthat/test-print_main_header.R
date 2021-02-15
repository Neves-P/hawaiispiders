test_that("Printing to console works", {
  datalist_name <- "test name"
  M <- 10
  model <- 1
  expect_message(
    print_main_header(datalist_name = datalist_name, M = M, model = model)
  )
})
