full_res <- readRDS("full_res.rds")
library(hawaiispiders)
prepared_out <- prepare_results_to_plot(full_res)

scenarios <- unique(prepared_out$scenario)

integrator_pairs <- list()
for (i in seq_along(scenarios)) {
  integrator_pairs[[i]] <- subset(prepared_out, scenario == scenarios[i])
}

out_list <- vector(mode = "list", length = length(scenarios))
names(out_list) <- scenarios
model_params <- DAISIEutils::setup_model("cr_dd")


for (i in seq_along(scenarios)) {
  initparsopt_odeint <- unlist(integrator_pairs[[i]][1, 2:6])
  testit::assert(integrator_pairs[[i]][1, 11] == factor("odeint"))

  initparsopt_lsodes <- unlist(integrator_pairs[[i]][2, 2:6])
  testit::assert(integrator_pairs[[i]][2, 11] == factor("lsodes"))

  res_odeint_lsodes <- DAISIE::DAISIE_ML(
    datalist = get(scenarios[i]),
    initparsopt = unlist(initparsopt_odeint),
    idparsnoshift = model_params$idparsnoshift,
    idparsopt = model_params$idparsopt,
    parsfix = model_params$parsfix,
    idparsfix = model_params$idparsfix,
    ddmodel = model_params$ddmodel,
    cond = 1,
    optimmethod = "subplex",
    methode = "lsodes",
    CS_version = model_params$cs_version
  )
  res_lsodes_odeint <- DAISIE::DAISIE_ML(
    datalist = get(scenarios[i]),
    initparsopt = unlist(initparsopt_lsodes),
    idparsnoshift = model_params$idparsnoshift,
    idparsopt = model_params$idparsopt,
    parsfix = model_params$parsfix,
    idparsfix = model_params$idparsfix,
    ddmodel = model_params$ddmodel,
    cond = 1,
    optimmethod = "subplex",
    methode = "odeint::runge_kutta_fehlberg78",
    CS_version = model_params$cs_version
  )

  testit::assert(names(out_list[i]) == scenarios[i])
  res <- rbind(res_odeint_lsodes, res_lsodes_odeint)
  res <- cbind(res, type = c("odeint initpars lsodes methode", "lsodes initpars odeint methode"))
  out_list[[i]] <- res
}

saveRDS(out_list, "cross_ll_test.rds")
