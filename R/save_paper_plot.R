#' Save a plot to current directory
#'
#' @inheritParams default_params_doc
#'
#' @return NULL. A pdf and png files with the plot to save are saved to the
#' working directory
#' @export
#'
#' @examples
save_paper_plot <- function(plot_to_save, file_name, type_size = "full_size") {

  file_name <- tools::file_path_sans_ext(file_name)

  if (identical(type_size, "full_size")) {
    ggplot2::ggsave(
      plot = plot_to_save,
      filename = file.path("figures", paste0(name, ".png")),
      device = "png",
      width = 168,
      height = 100,
      units = "mm",
      dpi = 600
    )
    ggplot2::ggsave(
      plot = plot_to_save,
      filename = file.path("figures", paste0(name, ".pdf")),
      device = "pdf",
      width = 168,
      height = 100,
      units = "mm",
    )
  } else if (identical(type_size, "half_size")) {
    ggplot2::ggsave(
      plot = plot_to_save,
      filename = file.path("figures", paste0(name, ".png")),
      device = "png",
      width = 168 / 2,
      height = 100 / 2,
      units = "mm",
      dpi = 600
    )
  ggplot2::ggsave(
    plot = plot_to_save,
    filename = file.path("figures", paste0(name, ".pdf")),
    device = "pdf",
    width = 168 / 2,
    height = 100 / 2,
    units = "mm",
  )
  }
}
