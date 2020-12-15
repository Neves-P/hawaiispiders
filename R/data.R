#' DAISIE datatable of spiders on Hawaii (Big Island)
#'
#' A dataset containing the colonization and branching times of spiders on Big
#' Island. This format can be passed to [DAISIE::DAISIE_dataprep()]. Endemicity
#' status refers strictly to Big Island endemics, and not endemics to the
#' Hawaiian archipelago in general.
#'
#' @format A tibble with 33 rows and 5 variables:
#' \describe{
#'   \item{Clade_name}{character vector with name of each lineage}
#'   \item{Status}{character vector with endemicity status. Can be `"Endemic"`,
#'   `"NonEndemic"` or `"Endemic_MaxAge"`}
#'   \item{Missing_species}{numeric with the number of known species that are
#'   missing in the phylogeny}
#'   \item{Branching_times}{ordered numeric vector with colonisation and
#'   branching times of each lineage}
#'   \item{Min_age}{numeric with the minimum age at which species could have
#'   colonised the island}
#' }
#' @source Jairo Patiño and Rosemary Gilliespie. Full reference list to be
#'   filled in later.
#' @references
#' GARB, J.E. and GILLESPIE, R.G. (2009), Diversity despite dispersal:
#' colonization history and phylogeography of Hawaiian crab spiders inferred
#' from multilocus genetic data. Molecular Ecology, 18: 1746-1764.
#' <https://doi.org/10.1111/j.1365-294X.2009.04125.x>
"spider_scenario_1"
