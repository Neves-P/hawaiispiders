#' Make results data frame
#'
#' @inheritParams
#'
#' @return A data frame with the results and the corresponding scenario
#' @export
#' @author Pedro Santos Neves
#'
#' @examples
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
