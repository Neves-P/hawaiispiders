#' Title
#'
#' @param datalist
#' @param island_age
#' @param M
#'
#' @return
#' @export
#'
#' @examples
run_spider_analysis <- function(datalist, island_age, M, model, seed) {

  set.seed(
    seed,
    kind = "Mersenne-Twister",
    normal.kind = "Inversion",
    sample.kind = "Rejection"
  )

  print(sessionInfo())

  r_lamc <- runif(1, min = 0, max = 2)
  r_mu <- runif(1, min = 0, max = 2)
  r_K <- runif(1, min = 6, max = 200)
  r_gam <- runif(1, min = 0, max = 0.0001)
  r_ana <- runif(1, min = 0.1, max = 4)


  model_arguments <- setup_model_arguments(
    model = model,
    r_lamc = r_lamc,
    r_mu = r_mu,
    r_K = r_K,
    r_gam = r_gam,
    r_ana = r_ana
  )
  ## M1  CS - DD
  if (model == "1") {
    ddmodel = 11
    idparsopt <- 1:5
    parsfix <- NULL
    idparsfix <- NULL
    idparsnoshift = 6:10
    initparsopt <- c(r_lamc, r_mu, r_K, r_gam, r_ana)
  }


  ## M2 CS - DI
  if (model == "2") {
    ddmodel = 0
    idparsopt <- c(1, 2, 4, 5)
    parsfix <- Inf
    idparsfix <- 3
    idparsnoshift = 6:10
    initparsopt <- c(r_lamc, r_mu, r_gam, r_ana)

  }


  ## M3 CS - DD no anagenesis
  if (model == "3") {
    ddmodel = 11
    idparsopt <- c(1, 2, 3, 4)
    parsfix <- 0
    idparsfix <- 5
    idparsnoshift = 6:10
    initparsopt <- c(r_lamc, r_mu, r_K, r_gam)

  }

  ## M4 CS - DI no anagenesis
  if (model == "4") {
    ddmodel = 0
    idparsopt <- c(1, 2, 4)
    parsfix <- c(Inf, 0)
    idparsfix <- c(3, 5)
    idparsnoshift = 6:10
    initparsopt <- c(r_lamc, r_mu, r_gam)
  }

  ##### RUN1 ML Optimization
  lik_res <- DAISIE_ML(
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
    the_dataset,
    model,
    the_init,
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
    file = paste(cluster_folder, "/a_", analysis_name, ".txt", sep = ""),
    ncol = length(to.write),
    append = TRUE,
    sep = "\t"
  )



  ##### RUN2 ML Optimization

  initparsopt <- lik_res[idparsopt]


  lik_res <-
    DAISIE_ML(
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
  to.write <-
    c(
      the_dataset,
      model,
      the_init,
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
    file = paste(cluster_folder, "/a_", analysis_name, ".txt", sep = ""),
    ncol = length(to.write),
    append = TRUE,
    sep = "\t"
  )
}
