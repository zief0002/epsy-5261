library(rvest)
library(httr)
library(stringr)

# url = "https://www.rottentomatoes.com/m/fast_x/reviews"
# 
# 
# x = httr::GET(url, add_headers('user-agent' = 'Gov employment data scraper ([[your email]])'))

rotten = read_html("~/Desktop/fastx/fastx12.html")
#rotten2 = read_html("~/Desktop/fastx/fastx2.html")

pub_reviewer = rotten |>
  html_elements(".reviewer-name-and-publication") |>
  html_elements("a") |>
  html_text()


# Remove whitespace
pub_reviewer = str_trim(pub_reviewer)

# Get reviewer and publication values
publication = pub_reviewer[c(FALSE, TRUE)]
reviewer = pub_reviewer[c(TRUE, FALSE)]

# Get text of review
review_text = rotten |>
  html_elements(".review-text") |>
  html_text()

review_text = str_trim(review_text)
review_text = str_replace_all(review_text, pattern = "\n", replacement = "")

# Get score
score = rotten |>
  html_elements(".original-score-and-url") |>
  html_text()

score = str_extract(score, "(?<=Original Score: ).*")

# str_sub(score, start = "Original Score: ", end = -1L)
# str_extract(score, "(?<=Score:)\\w$")
# sapply(str_split(score, "Original Score: "), `[`,2) 


# grep(score, pattern = "Original Score:\\w+$")
# 
# 
# score = as.integer(str_sub(score2, start = -1L))

# Get fresh/rotten score
fresh_rotten = rotten |>
  html_elements(".review-data") |>
  html_elements("score-icon-critic") |>
  html_attr("state")


# Create data frame
d1 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d2 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d3 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d4 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d5 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d6 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d7 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d8 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d9 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d10 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d11 = data.frame(reviewer, publication, review_text, score, fresh_rotten)
d12 = data.frame(reviewer, publication, review_text, score, fresh_rotten)


fastx_reviews = rbind(d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12)

fastx_reviews = fastx_reviews |>
  select(reviewer, publication, score, fresh_rotten, review_text) |>
  write_csv("~/Desktop/fastx-reviews.csv")


