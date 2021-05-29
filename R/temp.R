# o_c_no
o_c_no_sim <- DAISIE::DAISIE_sim_constant_rate(
  time = 2.4,
  M = 165,
  pars = c(0.5742499, 1.1457764, Inf, 0.1605413, 0.8343357),
  replicates = 1000
)
o_c_no_K <- DAISIE::DAISIE_sim_constant_rate(
  time = 2.4,
  M = 165,
  pars = c(0.5742499, 1.1457764, 10, 0.1605413, 0.8343357),
  replicates = 1000
)


plot_sims(island_replicates = o_c_no_K)
plot_sims(island_replicates = o_c_no_sim)
