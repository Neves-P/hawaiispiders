#' Default parameters documentation
#'
#' @param model Numeric integer with model that should run
#' @param r_lamc Numeric. Uniformly sampled value of cladogenesis rate
#' @param r_mu Numeric. Uniformly sampled value of extinction rate
#' @param r_k Numeric. Uniformly sampled value of carrying capacity
#' @param r_gam Numeric. Uniformly sampled value of immigration rate
#' @param r_ana Numeric. Uniformly sampled value of anagenesis rate
#' @param datalist_name Character with name of datalist to be used. Should be
#'   an exported dataset found in `/data` accessible by [data()]
#' @param M Numeric integer with mainland species number. In this case it refers
#'   to the total number of species on the Hawaiian archipelago. Defaults to 165
#' @param seed Integer to be used as seed
#' @param seed_range Numeric vector of 1 or 2. If only one element is supplied
#'   then the function will sample initial parameters with `seed = seed_range`.
#'   If the vector contains two elements, then `seed_range[2] - seed_range[1]`
#'   analysis will run in succession, with seeds ranging from
#'   `seed_range[1]:seed_range[2]`
#' @param file_path The system directory where the output files will be stored.
#' @param output_name A string. Will be the name of the created output folder.
#' @param verbose Boolean. Defaults to FALSE. If TRUE, session info and run
#' parameters are printed to the console/log file.
#'
#' @return Nothing
#' @export
default_params_doc <- function(model,
                               r_lamc,
                               r_mu,
                               r_k,
                               r_gam,
                               r_ana,
                               datalist_name,
                               M,
                               seed,
                               seed_range,
                               file_path,
                               output_name,
                               verbose) {
  # Nothing
}
