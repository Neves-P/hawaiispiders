library(hawaiispiders)

# Load data odeint
data(res_odeint)

data_to_plot <- prepare_results_to_plot(res_odeint)

facet_all_data <- make_faceted_plot(
  data_to_plot,
  partition_by = "island_age",
  colour_by = "stac",
  shape_by = "c_m"
)
save_paper_plot(
  plot_to_save = facet_all_data,
  file_name = "facet_all_data_odeint",
  type_size = "full_size"
)

rm(list = ls())
library(hawaiispiders)
# Load data lsodes
data(res_lsodes)

data_to_plot <- prepare_results_to_plot(res_lsodes)

facet_all_data <- make_faceted_plot(
  data_to_plot,
  partition_by = "island_age",
  colour_by = "stac",
  shape_by = "c_m"
)
save_paper_plot(
  plot_to_save = facet_all_data,
  file_name = "facet_all_data_lsodes",
  type_size = "full_size"
)

