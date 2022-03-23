## code to prepare `daisie_objects` goes here


# Check missing_species column when endemic and branching time is NA.
# Checksum of missing species with number of branching times in a clade
# Focus on method and how to deal with them. Link with new paper mascarenes
#
#
# table with which are at equilibrium
# use eq to get n_spec at equilibrium. daisie_expEIN. time Inf for div at eq
# what would spider biologists
#
#
data("c_master")
data("m_master")
library(usethis)

dataset_list <- list(c_master, m_master)

island_ages <- 1.2 * 1:4
age_names <- c("r", "y", "o", "a")
c_or_m <- c("c", "m")


dataset_out <- list()
dataset_ages <- list()
stac_handlings <- c("max", "min", "no")
name <- c()
for (h in seq_along(stac_handlings)) {
  for (i in seq_along(island_ages)) {
    dataset_c_m <- list()
    for (j in seq_along(dataset_list)) {
      dataset_template <- data.frame(
        "Clade_name" = character(),
        "Status" = character(),
        "Missing_species" = numeric(),
        "Branching_times" = numeric()
      )

      for (k in seq_len(nrow(dataset_list[[j]]))) {
        dataset_template[k, "Clade_name"] <- dataset_list[[j]][k, "Clade_name"]
        dataset_template[k, "Missing_species"] <- dataset_list[[j]][k, "Missing_species"]
        dataset_template[k, "Branching_times"] <- dataset_list[[j]][k, "Branching_times"]
        ages <- dataset_list[[j]][k, "Branching_times"]
        brts <- sort(
          as.numeric(unlist(strsplit(
            as.character(ages),
            split = ","))),
          decreasing = TRUE,
          na.last = TRUE
        )
        status_suffix <- ""
        min_age_available <- !is.na(dataset_list[[j]][k, "MinAge"])
        # MaxAge cases
        if ((brts[1] >= island_ages[i] || is.na(brts)) ||
            stac_handlings[h] == "max") {
          status_suffix <- "_MaxAge"
          # Can't have more brts is first brts > island_age
          if (length(brts) > 1 && brts[2] >= island_ages[i]) {
            dataset_template[k, "Branching_times"] <- paste(
              as.character(brts)[-2], sep = "", collapse = ","
            )
          }
        }
        # MinAge normal use and MinAge favouring cases (stac_handlings == "min")
        if ((isTRUE(min_age_available) && isTRUE(brts[1] >= island_ages[i])) ||
            (isTRUE(min_age_available) && stac_handlings[h] == "min"))  {
          status_suffix <- "_MaxAgeMinAge"
          dataset_template[k, "Branching_times"] <- paste(
            dataset_template[k, "Branching_times"],
            dataset_list[[j]][k, "MinAge"],
            sep = ","
          )
        }

        dataset_template[k, "Status"] <- paste0(
          dataset_list[[j]][k, "Status"],
          status_suffix
        )
      }
      dataset_c_m[[j]] <- dataset_template
      name_datatable <- paste(
        age_names[i],
        c_or_m[j],
        stac_handlings[h],
        "datatable",
        sep = "_"
      )
      name <- paste(
        age_names[i],
        c_or_m[j],
        stac_handlings[h],
        sep = "_"
      )
      assign(name_datatable, value = dataset_template)
      assign(name, value = DAISIE::DAISIE_dataprep(
        datatable = dataset_template,
        island_age = island_ages[i],
        M = 168
      ))
      do.call("use_data", list(as.name(name), overwrite = TRUE))
      do.call("use_data", list(as.name(name_datatable), overwrite = TRUE))
    }
    dataset_ages[[i]] <- dataset_c_m
  }
  dataset_out[[h]] <- dataset_ages
}
