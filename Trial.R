install.packages("rvest")
install.packages("polite")

library("rvest")
library("dplyr")
library("polite")

# Request permission to scrap from a website through ethics
page<-bow("https://www.reddit.com/",
          user_agent = "Susan Korwa", # contacts
          delay = 5,# time between scap
          force = FALSE) %>% # not forcing
  scrape()


rm(page)

# select url where you want to scrape your data
url<- "https://quotes.toscrape.com/"
# store the data in an object
page<- read_html(url)

# select what you want from the page
text<- page %>% html_nodes(".text") %>% html_text()
author<- page %>% html_nodes(".author") %>% html_text()

# Create a dataframe to store our data
quotes<- data.frame(text,author,stringsAsFactors = FALSE)

write.csv(quotes,"quotes.csv")

# Learn how to scrap in a loop so that you can pull from several pages
