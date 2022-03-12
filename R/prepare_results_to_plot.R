#' Prepare raw results table into plottable data
#'
#' @inheritParams default_params_doc
#'
#' @return A data frame containing the full results of the package
#'   estimate runs together with necessary columns for data partitioning. Has 14
#'   columns, the first 10 of which are as returned by
#'   `DAISIEutils::sensitivity()` and the remaining four contain the
#'   integration, island age, cladogenesis/migration grouping and treatment of
#'   uncertainty grouping. All these are made up as factors to allow easy
#'   plotting.
#' @export
#'
#' @examples
#' \dontrun{
#' full_res <- readRDS("full_res.rds")
#' results_to_plot <- prepare_results_to_plot(full_res)
#' }
prepare_results_to_plot <- function(raw_results) {
  factors <- sapply(raw_results$scenario, strsplit, split = "_")
  raw_results_colnames <- colnames(raw_results)
  plotting_table <- cbind(raw_results, NA, NA, NA)
  colnames(plotting_table) <- c(
    raw_results_colnames,
    "island_age",
    "c_m",
    "stac"
  )
  for (i in seq_along(factors)) {
    plotting_table$island_age[i] <- factors[[i]][1]
    plotting_table$c_m[i] <- factors[[i]][2]
    plotting_table$stac[i] <- factors[[i]][3]
  }
  plotting_table$island_age <- factor(
    plotting_table$island_age,
    levels = c("r", "y", "o", "a")
  )
  plotting_table$c_m <- factor(
    plotting_table$c_m,
    levels = c("c", "m")
  )
  plotting_table$stac <- factor(
    plotting_table$stac,
    levels = c("max", "min", "no")
  )
  levels(plotting_table$island_age) <- c("1.2", "2.4", "3.6", "4.8")
  levels(plotting_table$c_m) <- c("Cladogenesis", "Colonisation")
  levels(plotting_table$stac) <- c("1", "2", "3")
  plotting_table
}
