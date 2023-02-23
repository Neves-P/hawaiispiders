## code to prepare `daisie_objects` goes here


data("c_master")
data("m_master")
library(usethis)

dataset_list <- list(c_master, m_master)

island_ages <- c(0.3, 0.6, 1.2 * 1:4)
age_names <- c("q", "h", "r", "y", "o", "a")
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
      focal_dataset <- dataset_list[[j]]
      k <- 1
      while (nrow(focal_dataset) > 0) {
        dataset_template[k, "Clade_name"] <- focal_dataset[1, "Clade_name"]
        dataset_template[k, "Missing_species"] <- focal_dataset[1, "Missing_species"]
        dataset_template[k, "Branching_times"] <- focal_dataset[1, "Branching_times"]
        ages <- focal_dataset[1, "Branching_times"]
        brts <- sort(
          as.numeric(unlist(strsplit(
            as.character(ages),
            split = ","))),
          decreasing = TRUE,
          na.last = TRUE
        )
        status_suffix <- ""
        min_age_available <- !is.na(focal_dataset[1, "MinAge"])
        # MaxAge cases
        if ((brts[1] >= island_ages[i] || any(is.na(brts))) ||
            stac_handlings[h] == "max") {
          status_suffix <- "_MaxAge"
          # Can't have more brts if cladogenesis_t > island_age
          if (length(brts) > 1 && brts[2] >= island_ages[i]) { # Check: two statements?
            name_words <- unlist(
              strsplit(dataset_template[k, "Clade_name"], "_")
            )
            genera_index <- grep('[A-Z]+', name_words)
            dataset_template[k, "Clade_name"] <- paste(
              name_words[genera_index[1]],
              name_words[genera_index[2] - 1],
              sep = "_"
            )
            dataset_template[k, "Branching_times"] <- brts[1]
            dataset_template[k + 1, "Clade_name"] <- paste(
              name_words[seq(genera_index[2], length(name_words))],
              collapse = "_"
            )
            dataset_template[k + 1, "Missing_species"] <-
              focal_dataset[1, "Missing_species"]
            dataset_template[k + 1, "Branching_times"] <- brts[2]
            # General case requires an extra check per brts. Possibly vectorize?
            dataset_template[k + 1, "Status"] <- paste0(
              focal_dataset[1, "Status"],
              status_suffix
            )

          }
        }
        # MinAge normal use and MinAge favouring cases (stac_handlings == "min")
        # Note that max cases don't take minage if available
        if ((isTRUE(min_age_available) && isTRUE(brts[1] >= island_ages[i])) ||
            (isTRUE(min_age_available) && stac_handlings[h] == "min"))  {
          status_suffix <- "_MaxAgeMinAge"
          dataset_template[k, "Branching_times"] <- paste(
            dataset_template[k, "Branching_times"],
            focal_dataset[1, "MinAge"],
            sep = ","
          )
        }

        dataset_template[k, "Status"] <- paste0(
          focal_dataset[1, "Status"],
          status_suffix
        )
        focal_dataset <- focal_dataset[-1, ]
        k <- nrow(dataset_template) + 1
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
