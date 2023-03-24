#' Plot loglikelihood through time
#'
#' @param res
#'
#' @return
#' @export
#'
#' @examples
make_loglik_plot <- function(res) {
  prepped_res <- prepare_results_to_plot(res)
  prepped_res$island_age <- as.numeric(prepped_res$island_age)
  prepped_res <- dplyr::group_by(prepped_res, prepped_res$stac)
  ggplot2::ggplot(prepped_res) +
    ggplot2::guides(ggplot2::guide_legend(colour = "Uncertainty in\nnumber of\ncolonisations")) +
    ggplot2::geom_line(ggplot2::aes(x = island_age, y = loglik, colour = stac)) +
    ggplot2::xlab("Assumed island age (Ma)") +
    ggplot2::ylab("Loglikelihood")

}
