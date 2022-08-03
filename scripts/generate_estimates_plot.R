library(hawaiispiders)
# Load data
data(res)

old_version <- dplyr::filter(res, version == "4.1.0")
new_version <- dplyr::filter(res, version == "4.2.1")

data_to_plot <- prepare_results_to_plot(new_version)

facet_all_data <- make_faceted_plot(
  data_to_plot,
  partition_by = "island_age",
  colour_by = "stac",
  shape_by = "c_m"
)
save_paper_plot(
  plot_to_save = facet_all_data,
  file_name = "facet_all_data",
  type_size = "full_size"
)


