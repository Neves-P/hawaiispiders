res <- readRDS("full_res.rds")[1:24, ]
cross_scenario_ll <- readRDS("cross_scenario_ll.rds")
scenarios <- as.factor(unique(res$scenario))
diff_df <- data.frame(
  "scenario" = factor(levels = levels(scenarios)),
  "initpars_origin" = factor(levels = levels(scenarios)),
  "lambda_c" = numeric(),
  "mu" = numeric(),
  "K" = numeric(),
  "gamma" = numeric(),
  "lambda_a" = numeric(),
  "loglik" = numeric()
)
out_diff_df <- diff_df
for (i in seq_along(scenarios)) {
  cross_scenario_ll[[as.character(scenarios[i])]]
  cross_res <- subset(
    cross_scenario_ll[[as.character(scenarios[i])]],
    select = c(
      "lambda_c",
      "mu",
      "K",
      "gamma",
      "lambda_a",
      "loglik"
    )
  )
  scenario_res <- subset(
    res,
    scenario == as.character(scenarios[i]),
    select = c(
      "lambda_c",
      "mu",
      "K",
      "gamma",
      "lambda_a",
      "loglik"
    ))
  for (j in seq_len(nrow(cross_res))) {
    diff_df[j, ] <- cbind(
      scenario = scenarios[i],
      initpars_origin = as.factor(
        cross_scenario_ll[[as.character(scenarios[i])]]$initpars_origin[j]
      ),
      cross_res[j, ] - scenario_res
    )
  }
  out_diff_df <- rbind(out_diff_df, diff_df)
}
vars <- c(get_parameter_names(), "loglik")
var_names <- c(sapply(vars[1:5], translate_parameter_name, USE.NAMES = FALSE), "Loglikelihood")
heatmaps <- list()
for (i in seq_along(vars)) {
  p <- ggplot2::ggplot(
    out_diff_df,
    ggplot2::aes(initpars_origin, scenario, fill = get(vars[i]))
  ) +
    ggplot2::geom_tile() +
    ggplot2::theme(
      axis.text.x = ggplot2::element_text(angle = 45, vjust = 0.8, hjust = 1)
    ) +
    ggplot2::labs(fill = "Estimate -\n alt estimate") +
    ggplot2::ggtitle(var_names[i])
  ggplot2::ggsave(
    plot = p,
    filename = paste0(var_names[i], ".png"),
    device = "png",
    width = 168,
    height = 100,
    units = "mm",
    dpi = 600
  )
}



