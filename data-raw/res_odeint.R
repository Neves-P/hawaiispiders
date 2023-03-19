## code to prepare `res_odeint` dataset goes here

results_dir_odeint <- "G:/O meu disco/PhD/Projects/spiders/current_results/spiders_odeint/"


q_c_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("q_c_max", "q_c_min", "q_c_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

h_c_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("h_c_max", "h_c_min", "h_c_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

r_c_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("r_c_max", "r_c_min", "r_c_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

y_c_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("y_c_max", "y_c_min", "y_c_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

o_c_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("o_c_max", "o_c_min", "o_c_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

a_c_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("a_c_max", "a_c_min", "a_c_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

q_m_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("q_m_max", "q_m_min", "q_m_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

h_m_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("h_m_max", "h_m_min", "h_m_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

r_m_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("r_m_max", "r_m_min", "r_m_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

y_m_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("y_m_max", "y_m_min", "y_m_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

o_m_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("o_m_max", "o_m_min", "o_m_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)

a_m_sens <- make_res_df(
  DAISIEutils::sensitivity(
    data_names = c("a_m_max", "a_m_min", "a_m_no"),
    full_output = TRUE,
    results_dir = results_dir_odeint
  )$full_output
)
res_odeint <- rbind(
  q_c_sens,
  h_c_sens,
  r_c_sens,
  y_c_sens,
  o_c_sens,
  a_c_sens,
  q_m_sens,
  h_m_sens,
  r_m_sens,
  y_m_sens,
  o_m_sens,
  a_m_sens
)

usethis::use_data(res_odeint, overwrite = TRUE)
