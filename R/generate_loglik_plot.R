#' Plot loglikelihood through time
#'
#' @param res
#'
#' @return A plot of loglik through time.
#' @export
#'
#' @examples
#' data(res_odeint)
#' plot <- generate_loglik_plot(res_odeint)
generate_loglik_plot <- function(res) {
  prepped_res <- prepare_results_to_plot(res)
  prepped_res$island_age <- as.numeric(as.character(prepped_res$island_age))
  prepped_res <- dplyr::group_by(prepped_res, prepped_res$stac)
  ggplot2::ggplot(prepped_res) +
    ggplot2::geom_line(ggplot2::aes(x = island_age, y = loglik, colour = stac)) +
    ggplot2::scale_x_continuous(breaks = prepped_res$island_age) +
    ggplot2::scale_color_brewer(type = "qual", palette = "Set1") +
    ggplot2::labs(colour = "Uncertainty in\nnumber of\ncolonisations") +
    ggplot2::xlab("Assumed island age (Ma)") +
    ggplot2::ylab("Loglikelihood") +
    ggplot2::theme_classic()
    # ggplot2::geom_vline(
    #   xintercept = prepped_res$island_age,
    #   linetype = "dashed",
    #   linewidth = 0.4
    # )
}
