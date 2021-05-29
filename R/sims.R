generate_sims <- function() {
  scenarios <- spider_scenarios()
  rate_sens <- DAISIEutils::sensitivity(scenarios, full_output = TRUE)
}
