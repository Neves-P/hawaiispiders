args <- commandArgs(TRUE)

seed_range <- c(as.numeric(args[4]), as.numeric(args[5]))

library(hawaiispiders)

hawaiispiders::run_main(
  datalist_name = args[1],
  M = as.numeric(args[2]),
  model = as.numeric(args[3]),
  seed_range = seed_range,
  verbose = as.logical(args[6])
)
