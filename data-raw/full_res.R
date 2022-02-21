## code to prepare `full_res` dataset goes here

r_c_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("r_c_max", "r_c_min", "r_c_no"),
    full_output = TRUE
  )$full_output
)

y_c_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("y_c_max", "y_c_min", "y_c_no"),
    full_output = TRUE
  )$full_output
)

o_c_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("o_c_max", "o_c_min", "o_c_no"),
    full_output = TRUE
  )$full_output
)

a_c_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("a_c_max", "a_c_min", "a_c_no"),
    full_output = TRUE
  )$full_output
)

r_m_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("r_m_max", "r_m_min", "r_m_no"),
    full_output = TRUE
  )$full_output
)

y_m_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("y_m_max", "y_m_min", "y_m_no"),
    full_output = TRUE
  )$full_output
)

o_m_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("o_m_max", "o_m_min", "o_m_no"),
    full_output = TRUE
  )$full_output
)

a_m_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("a_m_max", "a_m_min", "a_m_no"),
    full_output = TRUE
  )$full_output
)
res_lsodes <- rbind(
  r_c_sens,
  y_c_sens,
  o_c_sens,
  a_c_sens,
  r_m_sens,
  y_m_sens,
  o_m_sens,
  a_m_sens
)
data.frame("integrator" = rep(factor("lsodes"), 24))
res_lsodes <- cbind(res_lsodes, data.frame("integrator" = rep(factor("lsodes"), 24)))
res_odeint <- cbind(res_odeint, data.frame("integrator" = rep(factor("odeint"), 24)))
full_res <- rbind(res_odeint, res_lsodes)

usethis::use_data(full_res, overwrite = TRUE)
