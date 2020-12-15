data(spider_scenario_1_pruned)
out <- hawaiispiders::DAISIE_dataprep(
  datatable = spider_scenario_1_pruned,
  island_age = 1.2,
  M = 170
)


# Pagiopalus nigriventis should not have c(1.20000, 1.19999) brts, but use
# MinAge
out[[3]]$branching_times
spider_scenario_1_pruned[2, ]

View(out[[3]])
View(spider_scenario_1_pruned[2, ])


# Unpruned data. Doesn't work yet (brts older than island)
# data(spider_scenario_1)
# DAISIE_dataprep(datatable = spider_scenario_1, island_age = 1.2, M = 170)

