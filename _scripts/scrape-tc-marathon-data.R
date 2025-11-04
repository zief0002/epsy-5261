library(rvest)

url = "https://www.mtecresults.com/race/show/14047/2022_Medtronic_Twin_Cities_Marathon-Marathon"

url = "https://www.mtecresults.com/race/quickResults?raceid=14047&version=280&overallf=yes"
url = "https://www.mtecresults.com/race/quickResults?raceid=14047&version=280&overallf=yes&offset=0&perPage=5000"

url = "https://www.mtecresults.com/race/quickResults?raceid=14047&version=280&overall=yes&offset=0&perPage=7000"


# retrieving the target web page 
document <- read_html(url)


# selecting the list of product HTML elements 
out1 =  document |> 
  html_elements("div.runnersearch-cell a") |>
 #html_attr("href") |>
  html_text()

res = cbind.data.frame(split(out1, rep(1:10, times=length(out1)/10)), stringsAsFactors=F)
names(res) = c("Bib", "Name", "Sex", "Age", "City", "State", "Overall", "SexPl", "DivPl", "Time")           


res |>
  write_csv("~/Desktop/tc-marathon-2022.csv")

res = read_csv("~/Desktop/tc-marathon-2022.csv")


res |>
  #filter(Sex == "M", State == "MN") |>
  #filter(Time < as.numeric(hms("03:00:00")) | Time > as.numeric(hms("03:00:00")))
  arrange(Time) |>
  ggplot(aes(x = Time)) +
  geom_density()
  



  
  
  mutate(
    time2 = as.numeric(as.POSIXct(Time))
  ) |>
  #sample_n(100) |>
  ggplot(aes(x = time2)) +
  geom_density(bw = 200)

density(as.numeric(as.POSIXct(res$Time)))
