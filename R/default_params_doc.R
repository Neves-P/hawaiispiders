#' Default parameters documentation
#'
#' @param model Numeric integer with model that should run
#' @param r_lamc Numeric. Uniformly sampled value of cladogenesis rate
#' @param r_mu Numeric. Uniformly sampled value of extinction rate
#' @param r_K Numeric. Uniformly sampled value of carrying capacity
#' @param r_gam Numeric. Uniformly sampled value of immigration rate
#' @param r_ana Numeric. Uniformly sampled value of anagenesis rate
#' @param datalist_name Character with name of datalist to be used. Should be
#'   an exported dataset found in `/data` accessible by [data()]
#' @param M Numeric integer with mainland species number. In this case it refers
#'   to the total number of species on the Hawaiian archipelago. Defaults to 165
#' @param seed Integer to be used as seed
#'
#' @return Nothing
#' @export
default_params_doc <- function(model,
                               r_lamc,
                               r_mu,
                               r_K,
                               r_gam,
                               r_ana,
                               datalist_name,
                               M,
                               seed) {
  # Nothing
}
