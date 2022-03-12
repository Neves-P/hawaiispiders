#' Make one results data frame out several individual scenarios runs
#'
#' Combines the results from the full output of `DAISIEutils::sensitivity()`
#' into a single data frame and appends a column at the end with the scenario
#' name
#'
#' @inheritParams default_params_doc
#'
#' @return A data frame with the results and the corresponding scenario
#' @export
#' @author Pedro Santos Neves
make_res_df <- function(sens) {
  out <- data.frame(
    "lambda_c" = numeric(),
    "mu" = numeric(),
    "K" = numeric(),
    "gamma" = numeric(),
    "lambda_a" = numeric(),
    "loglik" = numeric(),
    "df" = numeric(),
    "conv" = numeric(),
    "bic" = numeric(),
    "scenario" = character()
  )
  for (i in seq_along(sens)) {
    out <- rbind(out, cbind("scenario" = names(sens[i]), sens[[i]][[1]]))
  }
  out
}
