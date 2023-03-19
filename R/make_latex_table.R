#' Make latex table from results
#'
#' @inheritParams default_params_doc
#'
#' @return Nothing, prints latex table to the console
#' @export
#' @author Pedro Santos Neves
#'
#' @examples
#' \donttest{
#' data(res)
#' make_latex_table(res)
#' }
#' # % latex table generated in R 4.2.3 by xtable 1.8-4 package
#' # % Sun Mar 19 16:18:15 2023
#' # \begin{table}[ht]
#' # \centering
#' # \begin{tabular}{ccccccccc}
#' # \hline
#' # island\_age & c\_m & stac & lambda\_c & mu & K & gamma & lambda\_a & loglik \\
#' # \hline
#' # 0.3 & Back-colonisation allowed & CAT & 0.45 & 0.00 & 1.00 & 1.45 & 3.47 & -162.92 \\
#' # 0.3 & Back-colonisation allowed & PAT1 & 0.45 & 0.00 & 1.00 & 1.45 & 3.47 & -162.92 \\
#' # 0.3 & Back-colonisation allowed & PAT2 & 0.45 & 0.00 & 1.00 & 1.45 & 3.47 & -162.92 \\
#' # 0.6 & Back-colonisation allowed & CAT & 0.25 & 0.00 & 1.00 & 0.64 & 1.45 & -161.50 \\
#' # 0.6 & Back-colonisation allowed & PAT1 & 0.24 & 0.00 & 1.00 & 0.64 & 1.41 & -161.15 \\
#' # 0.6 & Back-colonisation allowed & PAT2 & 0.24 & 0.00 & 1.00 & 0.64 & 1.39 & -160.07 \\
#' # 1.2 & Back-colonisation allowed & CAT & 0.30 & 1.34 & 1.00 & 0.66 & 0.80 & -154.12 \\
#' # 1.2 & Back-colonisation allowed & PAT1 & 0.13 & 0.00 & 1.00 & 0.31 & 0.73 & -155.17 \\
#' # 1.2 & Back-colonisation allowed & PAT2 & 0.12 & 0.00 & 1.00 & 0.31 & 0.72 & -151.58 \\
#' # 2.4 & Back-colonisation allowed & CAT & 0.36 & 1.36 & 2.00 & 0.52 & 0.38 & -162.91 \\
#' # 2.4 & Back-colonisation allowed & PAT1 & 0.10 & 0.00 & 1.00 & 0.15 & 0.30 & -171.62 \\
#' # 2.4 & Back-colonisation allowed & PAT2 & 0.10 & 0.00 & 1.00 & 0.15 & 0.28 & -167.43 \\
#' # 3.6 & Back-colonisation allowed & CAT & 0.39 & 1.71 & 2.00 & 0.64 & 0.47 & -162.96 \\
#' # 3.6 & Back-colonisation allowed & PAT1 & 0.15 & 0.60 & 1.00 & 0.25 & 0.20 & -182.14 \\
#' # 3.6 & Back-colonisation allowed & PAT2 & 0.13 & 0.40 & 1.00 & 0.19 & 0.18 & -180.41 \\
#' # 4.8 & Back-colonisation allowed & CAT & 0.40 & 1.74 & 2.00 & 0.65 & 0.48 & -163.05 \\
#' # 4.8 & Back-colonisation allowed & PAT1 & 0.14 & 0.69 & 1.00 & 0.27 & 0.17 & -189.38 \\
#' # 4.8 & Back-colonisation allowed & PAT2 & 0.13 & 0.57 & 1.00 & 0.23 & 0.14 & -188.33 \\
#' # 0.3 & No back-colonisation & CAT & 0.32 & 0.00 & 1.00 & 1.51 & 3.25 & -165.42 \\
#' # 0.3 & No back-colonisation & PAT1 & 0.32 & 0.00 & 1.00 & 1.51 & 3.24 & -162.82 \\
#' # 0.3 & No back-colonisation & PAT2 & 0.32 & 0.00 & 1.00 & 1.51 & 3.24 & -162.82 \\
#' # 0.6 & No back-colonisation & CAT & 0.17 & 0.00 & 1.00 & 0.66 & 1.37 & -167.45 \\
#' # 0.6 & No back-colonisation & PAT1 & 0.17 & 0.00 & 1.00 & 0.66 & 1.33 & -164.44 \\
#' # 0.6 & No back-colonisation & PAT2 & 0.17 & 0.00 & 1.00 & 0.66 & 1.31 & -163.33 \\
#' # 1.2 & No back-colonisation & CAT & 0.18 & 1.16 & 1.00 & 0.62 & 0.82 & -158.86 \\
#' # 1.2 & No back-colonisation & PAT1 & 0.09 & 0.00 & 1.00 & 0.32 & 0.69 & -156.75 \\
#' # 1.2 & No back-colonisation & PAT2 & 0.09 & 0.00 & 1.00 & 0.32 & 0.68 & -153.13 \\
#' # 2.4 & No back-colonisation & CAT & 0.27 & 1.99 & 1.00 & 0.85 & 0.84 & -163.35 \\
#' # 2.4 & No back-colonisation & PAT1 & 0.07 & 0.00 & 1.00 & 0.15 & 0.32 & -176.12 \\
#' # 2.4 & No back-colonisation & PAT2 & 0.06 & 0.00 & 1.00 & 0.15 & 0.31 & -171.67 \\
#' # 3.6 & No back-colonisation & CAT & 0.28 & 2.23 & 1.06 & 0.96 & 0.99 & -162.30 \\
#' # 3.6 & No back-colonisation & PAT1 & 0.09 & 0.64 & 1.00 & 0.28 & 0.28 & -186.16 \\
#' # 3.6 & No back-colonisation & PAT2 & 0.07 & 0.41 & 1.00 & 0.21 & 0.24 & -184.94 \\
#' # 4.8 & No back-colonisation & CAT & 0.28 & 2.24 & 1.06 & 0.97 & 0.99 & -162.32 \\
#' # 4.8 & No back-colonisation & PAT1 & 0.08 & 0.71 & 1.00 & 0.30 & 0.25 & -193.20 \\
#' # 4.8 & No back-colonisation & PAT2 & 0.07 & 0.57 & 1.00 & 0.25 & 0.22 & -192.76 \\
#' # \hline
#' # \end{tabular}
#' # \end{table}
make_latex_table <- function(res) {
  prepped_res <- prepare_results_to_plot(res)
  df_for_latex <- cbind(prepped_res[, 11:13], prepped_res[2:7])
  df_for_latex$c_m <- c(
    rep("Back-colonisation allowed", 18),
      rep("No back-colonisation", 18)
  )
  print(
    xtable::xtable(
      df_for_latex,
      align = rep("c", ncol(df_for_latex) + 1) ,digits = 2),
    include.rownames = FALSE
  )
}
