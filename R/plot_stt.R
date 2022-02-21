#' Prepare input for stt
#'
#' @inheritParams default_params_doc
#'
#' @examples
#' utils::data("islands_1type_1000reps", package = "DAISIE")
#' simulation_outuputs <- hawaiispiders:::convert_to_classic_plot(
#'   islands_1type_1000reps
#' )
#' @note
#' This function is taken from [`DAISIE::DAISIE-package`] and simplified, as it
#' is not exported there.
#' @return a list with wrangled data to be used for plotting STT plots with
#' plot_stt
#' @keywords internal
convert_to_classic_plot <- function(simulation_outputs) {
  replicates <- length(simulation_outputs)
  ### STT ALL species
  s_freq <- length(simulation_outputs[[1]][[1]]$stt_all[, 1])
  complete_arr <- array(dim = c(s_freq, 6, replicates))
  for (x in 1:replicates) {
    sum_endemics <- simulation_outputs[[x]][[1]]$stt_all[, "nA"] +
      simulation_outputs[[x]][[1]]$stt_all[, "nC"]
    total <- simulation_outputs[[x]][[1]]$stt_all[, "nA"] +
      simulation_outputs[[x]][[1]]$stt_all[, "nC"] +
      simulation_outputs[[x]][[1]]$stt_all[, "nI"]
    complete_arr[, , x] <- cbind(
      simulation_outputs[[x]][[1]]$stt_all[, c("Time", "nI", "nA", "nC")],
      sum_endemics,
      total
    )
  }
  stt_average_all <- apply(complete_arr, c(1, 2), stats::median)

  stt_q0_025_all <- apply(complete_arr, c(1, 2), stats::quantile, 0.025)
  stt_q0_25_all <- apply(complete_arr, c(1, 2), stats::quantile, 0.25)
  stt_q0_75_all <- apply(complete_arr, c(1, 2), stats::quantile, 0.75)
  stt_q0_975_all <- apply(complete_arr, c(1, 2), stats::quantile, 0.975)
  colnames(stt_average_all) <- c("Time", "nI", "nA", "nC", "Endemic", "Total")
  colnames(stt_q0_025_all) <- c("Time", "nI", "nA", "nC", "Endemic", "Total")
  colnames(stt_q0_25_all) <- c("Time", "nI", "nA", "nC", "Endemic", "Total")
  colnames(stt_q0_75_all) <- c("Time", "nI", "nA", "nC", "Endemic", "Total")
  colnames(stt_q0_975_all) <- c("Time", "nI", "nA", "nC", "Endemic", "Total")
  all_species <- list(
    stt_average = stt_average_all,
    stt_q0.025 = stt_q0_025_all,
    stt_q0.25 = stt_q0_25_all,
    stt_q0.75 = stt_q0_75_all,
    stt_q0.975 = stt_q0_975_all
  )
  return(list(
    all_species = all_species
  ))
}

#' Create the Species-Through-Time plot
#'
#' This is used to visualize the output of sim functions.
#'
#' @note
#' This function is modified from [DAISIE::DAISIE_plot_stt]. The location
#' of the legend is shifted to the bottom right-hand side and the grey colour
#' scheme is replaced by a green one.
#' @author Luis Valente, Pedro Santos Neves
#' @inheritParams default_params_doc
#'
#' @keywords internal
plot_stt <- function(time,
                     plot_lists = plot_lists,
                     type = type) {
  # Plot the y axis iff plus one
  y_axis_type <- "n"
  y_axis_label <- "Number of species"
  stt <- plot_lists[[type]]
  if (is.null(stt)) {
    return()
  }
  suppressWarnings(
    graphics::plot(
      NULL, NULL,
      xlim = rev(c(0, time)), ylim = c(1, max(stt$stt_q0.975)),
      ylab = y_axis_label,
      bty = "l", xaxs = "i", xlab = "Time before present (myr)",
      main = "Species-through-time",
      log = "y", cex.lab = 1.2, cex.main = 1.2, cex.axis = 1.2,
      yaxt = y_axis_type
    )
  )
  graphics::polygon(
    c(stt$stt_average[, "Time"], rev(stt$stt_average[, "Time"])),
    c(stt$stt_q0.025[, "Total"] + 1, rev(stt$stt_q0.975[, "Total"] + 1)),
    col = "#8E9775",
    border = NA
  )
  graphics::polygon(
    c(stt$stt_average[, "Time"], rev(stt$stt_average[, "Time"]))
    , c(stt$stt_q0.25[, "Total"] + 1, rev(stt$stt_q0.75[, "Total"] + 1)),
    col = "#4A503D",
    border = NA
  )
  graphics::lines(
    stt$stt_average[, "Time"],
    stt$stt_average[, "Total"] + 1,
    lwd = 2
  )
  graphics::lines(
    stt$stt_average[, "Time"],
    stt$stt_average[, "nI"] + 1,
    lwd = 2,
    col = "cyan3"
  )
  graphics::lines(
    stt$stt_average[, "Time"],
    stt$stt_average[, "Endemic"] + 1,
    lwd = 2,
    col = "#E28F83"
  )
  legend_names <- c("Total", "Non-endemic", "Endemic")
  legend_colors <- c("black", "cyan3", "#E28F83")
  graphics::legend(
    "bottomright",
    legend_names,
    lty = 1,
    lwd = 2,
    col = legend_colors,
    cex = 1.2,
    border = NA,
    bty = "n"
  )
  y_axis_values <- c(1, 2, 5, 10, 20, 50, 100, 200, 500, 1000)
  graphics::axis(2, at = y_axis_values, labels = y_axis_values - 1)
}
