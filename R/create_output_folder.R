#' Create model output folder
#'
#' @inheritParams default_params_doc
#'
#' @return Creates appropriate directory. Returns string with path for
#' output object.
#' @export
#' @author Pedro Neves
#'
#' @examples
#' \dontrun{
#' create_output_folder(output_name = "results_folder", model = 1)
#' }
create_output_folder <- function(output_name, model) {

  cluster_folder <- file.path("spiders", output_name)
  if (!dir.exists(cluster_folder)) {
    dir.create(path = cluster_folder, recursive = TRUE)
  }
  file_path <- file.path(
    cluster_folder,
    paste0(output_name, "_", "m_", model, ".txt")
  )

  file_path
}
