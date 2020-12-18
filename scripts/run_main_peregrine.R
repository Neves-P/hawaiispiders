args <- commandArgs(TRUE)
print(args)
seed_range <- c(as.numeric(args[4]), as.numeric(args[5]))

hawaiispiders::run_main(
  datalist_name = args[1],
  M = as.numeric(args[2]),
  model = as.numeric(args[3]),
  seed_range = seed_range
)
