data(spider_scenario_1_pruned, package = "hawaiispiders")
out <- hawaiispiders::DAISIE_dataprep(
  datatable = spider_scenario_1_pruned,
  island_age = 1.2,
  M = 170
)


# Pagiopalus nigriventis should not have c(1.20000, 1.19999, 0.387) brts, but
# only c(1.1999, 0.387)?
out[[3]]$branching_times
spider_scenario_1_pruned[2, ]

# Mecaphesa anguliventris should be stac 8 and have  c(1.2000, 0.3078, 0.0166)
# as branching times?
out[[16]]$branching_times
spider_scenario_1_pruned[15, ]


# Unpruned data. Doesn't work yet (brts older than island)
# data(spider_scenario_1)
# DAISIE_dataprep(datatable = spider_scenario_1, island_age = 1.2, M = 170)

