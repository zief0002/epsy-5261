new = read_csv(
  file = "~/Documents/data/college-data/college-scorecard-raw-data-2022-09-01/Most-Recent-Cohorts-Institution.csv", 
  na = c("", "NA", "NULL", "PrivacySuppressed")
  )



# Pick colleges (smapled earlier)
my_colleges = c(
  "The Evergreen State College", "Chatham University", "CUNY Lehman College", "Illinois State University", 
  "Southeastern Oklahoma State University", "Radford University", "Stanford University", 
  "Yale University", "Mills College", "Mercyhurst University", "Eastern Nazarene College", 
  "Texas A & M University-Kingsville", "Rollins College", "St. John's College", "Judson College", 
  "Stony Brook University", "University of Baltimore", "La Sierra University", "Concordia College at Moorhead", 
  "San Francisco State University", "Mansfield University of Pennsylvania", "University of Florida", 
  "CUNY City College", "Converse College", "Mitchell College", "Westmont College", "SUNY College of Technology at Alfred", 
  "Western Kentucky University", "Frostburg State University", "Johnson & Wales University-Online", "Beacon College", 
  "Lindenwood University", "University of Massachusetts-Amherst", "Clemson University", "Rhode Island College", 
  "Texas County Technical College", "Manhattanville College", "University of Connecticut-Hartford Campus", "Drew University", 
  "Eastern New Mexico University-Main Campus", "Harrison College-Grove City", "Bard College", "Pomona College", 
  "Upper Iowa University", "University of North Carolina at Chapel Hill", "University of Alaska Fairbanks", 
  "Henderson State University", "Rochester College", "Carnegie Mellon University ", "Life University", 
  "Notre Dame of Maryland University", "University of Nebraska-Lincoln", "Stevens Institute of Technology", 
  "Texas Wesleyan University", "Occidental College", "Gordon College", "Tennessee Technological University", 
  "Cedarville University", "Otis College of Art and Design", "Webster University", "Millersville University of Pennsylvania", 
  "Sweet Briar College", "Xavier University", "St. Joseph's College of Nursing", "Brandeis University", 
  "Saint Ambrose University", "Florida Institute of Technology", "SUNY College at Geneseo", "Abraham Baldwin Agricultural College", 
  "Mercy Hospital School of Nursing", "Ball State University", "East Texas Baptist University", "Lyon College", 
  "Oakland City University", "Rider University", "Massachusetts Institute of Technology", "Indiana State University", 
  "Abilene Christian University", "Universidad Central Del Caribe", "Keuka College", "Penn Commercial Business/Technical School", 
  "Catawba College", "University of Lynchburg", "Marquette University", "Nyack College", "Shepherd University", 
  "University of North Florida", "The University of Texas at El Paso", "Andrews University", "San Francisco Conservatory of Music", 
  "Belmont University", "Culver-Stockton College", "Northwestern College-Chicago Campus", 
  "The College of New Rochelle", "Manhattan School of Music", "Providence College", "University of Maine at Farmington", 
  "Art Center College of Design", "Oberlin College", "The University of Texas at Arlington", "Western Michigan University", 
  "Watkins College of Art Design & Film", "Union College", "DeVry University-Colorado", "Elmira College", 
  "Franklin W Olin College of Engineering", "Juniata College", "William Jessup University", "Southern New Hampshire University", 
  "Doane University-Arts & Sciences", "Randolph-Macon College", "Central Connecticut State University", "Mount Aloysius College", 
  "Arizona Christian University", "EDP University of Puerto Rico Inc-San Juan", "Long Island Business Institute", 
  "Marion Military Institute", "Utah State University", "Eastern Michigan University", "Concorde Career College-San Antonio", 
  "The University of Alabama", "New Mexico State University-Main Campus", "Sam Houston State University", "DeVry University-New Jersey", 
  "Loyola University New Orleans", "Point Park University", "Tougaloo College", "New Jersey Institute of Technology", 
  "FIDM-Fashion Institute of Design & Merchandising-Los Angeles", "Duquesne University", "Plaza College", 
  "University of Illinois at Urbana-Champaign", "Design Institute of San Diego", "Southern Connecticut State University", 
  "Houghton College", "Paine College", "Southern Illinois University-Edwardsville", "Belanger School of Nursing", 
  "Spalding University", "University of Wisconsin-Stevens Point", "Kennesaw State University", 
  "Cairn University-Langhorne", "Carroll College", "Bluffton University", "Armstrong State University", "Lamar University", 
  "California State University-Chico", "Presentation College", "Bates College", "Messiah College", 
  "Concorde Career College-Grand Prairie", "University of Oklahoma-Norman Campus", "Central State University", 
  "SUNY College at Old Westbury", "Inter American University of Puerto Rico-Arecibo", "Oral Roberts University", 
  "University of Evansville", "Dutchess BOCES-Practical Nursing Program", "Colorado State University-Fort Collins", 
  "Finlandia University", "Bloomfield College", "Miami University-Oxford", "Carlos Albizu University-San Juan", 
  "Colby-Sawyer College", "Oklahoma Baptist University", "Cabrini University", "Augsburg University", 
  "Good Samaritan College of Nursing and Health Science", "Hampden-Sydney College", "Texas Tech University", 
  "Notre Dame College", "University of Minnesota-Duluth", "Biola University", "Fort Lewis College", 
  "California State University-Monterey Bay", "University of Missouri-Kansas City", "Sacred Heart University", 
  "Carson-Newman University", "DeVry University-Virginia", "University of Alaska Southeast", "McPherson College", 
  "Dordt College", "Elon University", "The College of Wooster", "Mississippi College", "University of Mary", 
  "Cornell University", "Lee University", "University of Wisconsin-River Falls", "Binghamton University", 
  "Southern Vermont College", "DeVry College of New York", "North Central College", "DeSales University", 
  "Edward Waters College", "San Diego Culinary Institute", "University of Hartford", "Saint Mary's University of Minnesota", 
  "Stevenson University", "Cedar Crest College", "Hope College", "University of Hawaii-West Oahu", "Lancaster Bible College", 
  "Moore College of Art and Design", "Silver Lake College of the Holy Family", "Gonzaga University", 
  "University of South Carolina-Aiken", "Hannibal-LaGrange University", "McNeese State University", "The New School", 
  "La Roche University", "Southeast Missouri State University", "Chaminade University of Honolulu", "Southwestern Oklahoma State University", 
  "Trine University", "Ave Maria University", "Columbus College of Art and Design", "Northwestern University", "Tusculum University", 
  "Johnson C Smith University", "New Hampshire Institute of Art", "Quinnipiac University", "Fox College", 
  "Midwestern Baptist Theological Seminary", "John Carroll University", "The New England Conservatory of Music", 
  "Johnson University", "Temple University", "AdventHealth University", "Holy Name Medical Center-Sister Claire Tynan School of Nursing", 
  "Ferrum College", "Widener University", "Universidad del Sagrado Corazon", "Pace University", 
  "Washington University in St Louis", "Harrison College-Morrisville", "Madison Oneida BOCES-Practical Nursing Program", 
  "Southern California Institute of Architecture", "Wells College", "Baptist Health College Little Rock", "University of New Haven", 
  "Akron School of Practical Nursing", "Haverford College", "DeVry University-Arizona", "Dickinson College", "
  Trinity Health System School of Nursing", "Nebraska Wesleyan University", "Rice University", "Baylor University", 
  "California State University-San Marcos"
  )

new |>
  select(
    name = INSTNM, 
    state = STABBR, 
    region = REGION,
    inst_type = CCSIZSET,
    control = CONTROL,
    adm_rate = ADM_RATE,
    num_undergrads = UGDS,
    median_debt = DEBT_MDN, 
    median_debt_grads = GRAD_DEBT_MDN, 
    median_earnings = MD_EARN_WNE_P10
    ) |>
  mutate(
    #bachelors_degree = if_else(HIGHDEG >= 3, 1, 0),
    region = case_when(
      region == 0 ~	"U.S. Service Schools",
      region == 1 ~	"New England",
      region == 2 ~	"Mid East",
      region == 3 ~	"Great Lakes",
      region == 4 ~	"Plains",
      region == 5 ~	"Southeast",
      region == 6 ~	"Southwest",
      region == 7 ~	"Rocky Mountains",
      region == 8 ~	"Far West",
      region == 9 ~	"Outlying Areas"
    ),
    inst_type = case_when(
      inst_type %in% 1:5 ~ "Two-year undergraduate",
      inst_type %in% 6:17 ~ "Four-year undergraduate",
      inst_type %in% 18 ~ "Exclusively graduate/professional",
      .default = NA
    ),
    control = case_when(
      control == 1 ~ "Public",
      control == 2 ~ "Private nonprofit",
      control == 3 ~ "Private for-profit"
    )
  ) |>
  #select(-HIGHDEG) |>
  filter(name %in% my_colleges) |>
  #drop_na()
  arrange(name) -> new2

new2


summary(new2)

write_csv(new2, "~/Desktop/college-scorecard.csv")



new_colleges = c("Marlboro College")

new |>
  select(
    name = INSTNM, 
    state = STABBR, 
    region = REGION,
    inst_type = CCSIZSET,
    control = CONTROL,
    adm_rate = ADM_RATE,
    num_undergrads = UGDS,
    median_debt = DEBT_MDN, 
    median_debt_grads = GRAD_DEBT_MDN, 
    median_earnings = MD_EARN_WNE_P10
  ) |>
  mutate(
    #bachelors_degree = if_else(HIGHDEG >= 3, 1, 0),
    region = case_when(
      region == 0 ~	"U.S. Service Schools",
      region == 1 ~	"New England",
      region == 2 ~	"Mid East",
      region == 3 ~	"Great Lakes",
      region == 4 ~	"Plains",
      region == 5 ~	"Southeast",
      region == 6 ~	"Southwest",
      region == 7 ~	"Rocky Mountains",
      region == 8 ~	"Far West",
      region == 9 ~	"Outlying Areas"
    ),
    inst_type = case_when(
      inst_type %in% 1:5 ~ "Two-year undergraduate",
      inst_type %in% 6:17 ~ "Four-year undergraduate",
      inst_type %in% 18 ~ "Exclusively graduate/professional",
      .default = NA
    ),
    control = case_when(
      control == 1 ~ "Public",
      control == 2 ~ "Private nonprofit",
      control == 3 ~ "Private for-profit"
    )
  ) |>
  #select(-HIGHDEG) |>
  filter(name %in% c("Wells College")) |>
  #drop_na()
  arrange(name)
