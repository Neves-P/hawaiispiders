#' @title Plot island species-through-time (STT) plots
#' @description Produces STT plots.
#'
#' R plots with number of total, endemic and non-endemic STTs for different
#' types of species for the entire time span the islands were simulated.
#' 2.5-97.5th percentiles are plotted in light green, 25-75th percentiles
#' plotted in dark green.
#'
#' @note
#' This is an alternative colour scheme with minor modifications from
#' [DAISIE::DAISIE_plot_sims()]. This version is simplified and always assumes
#' simulations were ran with `sample_freq` other than `Inf` and
#'
#' @inheritParams default_params_doc
#'
#' @return R plot.
#' @author Luis Valente, Pedro Neves
#' @references Valente, L.M., A.B. Phillimore and R.S. Etienne (2015).
#' Equilibrium and non-equilibrium dynamics simultaneously operate in the
#' Galapagos islands. Ecology Letters 18: 844-852.
#' @keywords models
#' @export
#' @examples

#' ### Plot islands with single process (only one type of species)
#' utils::data(islands_1type_1000reps, package = "DAISIE")
#' plot_sims(
#'   island_replicates = islands_1type_1000reps
#' )
#'
plot_sims <- function(
  island_replicates
) {
  time <- max(island_replicates[[1]][[1]]$stt_all[, 1])
    # Prepare dataset
    plot_lists <- convert_to_classic_plot(island_replicates)
    types <- names(plot_lists)

  num_plots <- sum(!sapply(plot_lists[types], FUN = is.null))
  graphics::par(mfrow = c(1, num_plots))
  for (type_here in types) {
    plot_stt(
      time = time,
      plot_lists = plot_lists,
      type = type_here)
  }
}
