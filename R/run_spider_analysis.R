#' Run spider analysis
#'
#' @inheritParams default_params_doc
#'
#' @return Nothing. Writes to file.
#' @export
#'
#' @examples
#' \dontrun{
#' run_spider_analysis(
#'   datalist_name = "spider_scenario_1_1_1_datalist",
#'   M = 165,
#'   model = 1,
#'   seed = 1,
#'   file_path
#' )
#' }
run_spider_analysis <- function(datalist_name,
                                M = 165,
                                model,
                                seed,
                                file_path) {

  # load(file.path("data", paste0(datalist_name, ".rda")))
  datalist <- get(datalist_name)

  island_age <- datalist[[1]]$island_age

  set.seed(
    seed,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )

  r_lamc <- stats::runif(1, min = 0, max = 2)
  r_mu <- stats::runif(1, min = 0, max = 2)
  r_K <- stats::runif(1, min = 6, max = 200)
  r_gam <- stats::runif(1, min = 0, max = 0.0001)
  r_ana <- stats::runif(1, min = 0.1, max = 4)

  type <- 1
  P_type2 <- 0

  model_arguments <- setup_model_arguments(
    model = model,
    r_lamc = r_lamc,
    r_mu = r_mu,
    r_K = r_K,
    r_gam = r_gam,
    r_ana = r_ana
  )

  initparsopt <- model_arguments$initparsopt
  idparsnoshift <- model_arguments$idparsnoshift
  idparsopt <- model_arguments$idparsopt
  parsfix <- model_arguments$parsfix
  idparsfix <- model_arguments$idparsfix
  ddmodel <- model_arguments$ddmodel
  methode <- "lsodes"
  cond <- 1
  res <- 100

  ##### RUN1 ML Optimization
  lik_res <- DAISIE::DAISIE_ML(
    datalist = datalist,
    initparsopt = initparsopt,
    idparsnoshift = idparsnoshift,
    idparsopt = idparsopt,
    parsfix = parsfix,
    idparsfix = idparsfix,
    ddmodel = ddmodel,
    methode = methode,
    cond = cond,
    res = res
  )

  lik_res <- as.matrix(lik_res)
  to.write <- c(
    datalist_name,
    model,
    seed,
    island_age,
    M,
    type,
    P_type2,
    res,
    methode,
    "R1",
    as.matrix(lik_res),
    initparsopt
  )
  write(
    to.write,
    file = file_path,
    ncolumns = length(to.write),
    append = TRUE,
    sep = "\t"
  )



  ##### RUN2 ML Optimization

  initparsopt <- lik_res[idparsopt]


  lik_res <- DAISIE::DAISIE_ML(
    datalist = datalist,
    initparsopt = initparsopt,
    idparsnoshift = idparsnoshift,
    idparsopt = idparsopt,
    parsfix = parsfix,
    idparsfix = idparsfix,
    ddmodel = ddmodel,
    methode = methode,
    cond = cond,
    res = res
  )

  lik_res <- as.matrix(lik_res)
  to.write <- c(
    datalist_name,
    model,
    seed,
    island_age,
    M,
    type,
    P_type2,
    res,
    methode,
    "R2",
    as.matrix(lik_res),
    initparsopt
  )
  write(
    to.write,
    file = file_path,
    ncolumns = length(to.write),
    append = TRUE,
    sep = "\t"
  )
}
