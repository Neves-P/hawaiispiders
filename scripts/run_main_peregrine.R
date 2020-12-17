args <- commandArgs(TRUE)

seed_range <- c(args[4], args[5])

hawaiispiders::run_main(
  datalist_name = args[1],
  M = args[2],
  model = args[3],
  seed_range = seed_range
)
