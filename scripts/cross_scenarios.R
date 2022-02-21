full_res <- readRDS("full_res.rds")
library(hawaiispiders)
prepared_out <- prepare_results_to_plot(full_res[1:24, ])

scenarios <- unique(prepared_out$scenario)

starter_pars <- list()
for (i in seq_along(scenarios)) {
  starter_pars[[i]] <- subset(prepared_out, scenario != scenarios[i])[, 1:6]
}
names(starter_pars) <- scenarios

out_list <- vector(mode = "list", length = length(scenarios))
names(out_list) <- scenarios
model_params <- DAISIEutils::setup_model("cr_dd")


for (i in seq_along(scenarios)) {
  res_out <- data.frame(
    lambda_c = numeric(),
    mu = numeric(),
    K = numeric(),
    gamma = numeric(),
    lambda_a = numeric(),
    loglik = numeric(),
    df = numeric(),
    conv = numeric(),
    scenario = character(),
    initpars_origin = character()
  )
  for (j in seq_len(nrow(starter_pars[[i]]))) {

    initparsopt <- unlist(starter_pars[[i]][j, 2:6])

    res <- DAISIE::DAISIE_ML(
      datalist = get(scenarios[i]),
      initparsopt = initparsopt,
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
    res <- cbind(
      res,
      scenario = scenarios[i],
      initpars_origin = starter_pars[[i]][j, 1]
    )
    res_out <- rbind(res_out, res)
  }
  out_list[[i]] <- res_out
}

saveRDS(out_list, "cross_scenario_ll.rds")
