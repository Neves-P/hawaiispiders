#' Plot loglikelihood through time
#'
#' @inheritParams default_params_doc
#'
#' @return A plot of loglik through time.
#' @export
#'
#' @examples
#' data(res_lsodes)
#' plot <- generate_loglik_plot(res_lsodes)
generate_loglik_plot <- function(res) {
  prepped_res <- prepare_results_to_plot(res)
  prepped_res$island_age <- as.numeric(as.character(prepped_res$island_age))
  prepped_res <- dplyr::group_by(prepped_res, prepped_res$stac)

  prepped_res$c_m <- c(
    rep("Back-colonisation\nallowed", 18),
    rep("No back-colonisation", 18)
  )

  ggplot2::ggplot(prepped_res) +
    ggplot2::geom_line(ggplot2::aes(
      x = island_age,
      y = loglik,
      colour = stac,
      linetype = c_m)
    ) +
    ggplot2::scale_x_continuous(breaks = prepped_res$island_age) +
    ggplot2::scale_color_brewer(type = "qual", palette = "Set1") +
    ggplot2::labs(
      colour = "Uncertainty in\ncolonisation time",
      linetype = "Uncertainty in\nnumber of\ncolonisations"
    ) +
    ggplot2::xlab("Assumed island age (Ma)") +
    ggplot2::ylab("Loglikelihood") +
    ggplot2::theme_classic() +
    ggplot2::theme(axis.title.x = ggplot2::element_text(size = 9)) +
    ggplot2::theme(axis.title.y = ggplot2::element_text(size = 8)) +
    ggplot2::theme(legend.title = ggplot2::element_text(size = 9))
  # ggplot2::geom_vline(
  #   xintercept = prepped_res$island_age,
  #   linetype = "dashed",
  #   linewidth = 0.4
  # )
}
