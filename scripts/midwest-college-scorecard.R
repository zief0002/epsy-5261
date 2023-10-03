college = read.csv(file = "~/Desktop/MERGED-2021.csv", 
                   na.strings = c("NA", "NULL", "PrivacySuppressed"))


college$CONTROL2 = factor(college$CONTROL, labels = c("Public", "Private (Non-Profit)", "Private (For-Profit)"))

college$HIGHDEG2 = factor(college$HIGHDEG, labels = c("Non-degree-granting", 
                                                      "Certificate degree", "Associate degree", "Bachelor's degree", "Graduate degree"))



college2 = college |>
  select(
    institution = INSTNM, 
    control = CONTROL2, 
    state = STABBR, 
    admission_rate = ADM_RATE, 
    act = ACTCM75, 
    debt_all = DEBT_MDN, 
    debt_graduates = GRAD_DEBT_MDN, 
    earnings = MD_EARN_WNE_P10,
    completion_rate = C150_4)


college2 |>
  filter(state %in% c("MN", "WI", "IA", "ND", "SD")) |>
  drop_na(act, completion_rate) |>
  write_csv("~/Desktop/college-scorecard.csv")
  
  
  
  
  ggplot(aes(x = act, y = completion_rate)) + geom_point()

