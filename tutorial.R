# Tutorial API em R
# https://www.programmableweb.com/news/how-to-access-any-restful-api-using-r-language/how-to/2017/07/21

##### Declaração de funções #####

inst.pack <- function(pkg){
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg))
    install.packages(new.pkg, dependencies = TRUE)
  sapply(pkg, library, character.only = TRUE)
}

##### Tutorial ####


# Start your script off by installing the httr package.
# This package makes requesting data from just about any API easier by formatting your GET requests with 
# the proper headers and authentications

packages <- c("httr")
inst.pack(packages)
library("httr")

# Next, install jsonlite in your script:
# When the data comes back from many APIs, it will be in JSON format. If you're like most R users, you'll 
# want to convert the JSON from its native nested form to a flat form like a data frame so it's easier to work 
# with. The jsonlite package makes this easy.

packages <- c("jsonlite")
inst.pack(packages)
library("jsonlite")

# These two simple packages make it possible for R to work with many APIs even if a prebuilt R SDK doesn't 
# exist for those APIs.

# Pulling data from a RESTful API often requires an API password, an API username, or both, as well as a 
# properly formatted URL and header. The URL (which is technically known as the address of the API's "endpoint") 
# tells the API what data you're looking for and the username/password is for APIs that have what's called "basic 
# authentication" (not all do, but the example assumes this to be true). The headers are often used to negotiate 
# other parameters that enable the application to communicate with the API successfully. For example, they may 
# describe the formatting of the data payload.

# As an example, you'll make a request for stock prices to the Intrinio API.
# ... They can be found under the Access Keys heading of the account area on the Intrinio website.
username <- "OjMxZmQ0NGQzYzRiZDQyNzZjMDMxMmZkMmM3MWJlN2Ew"
password <- ""


# Once you've pasted this example all together, you'll be able to retrieve stock prices for Apple:

base <- "https://api-v2.intrinio.com/"
endpoint <- "companies/"
stock <- "AAPL"

call1 <- paste0(base,endpoint,stock,"?api_key=",username)

# Now that you have your username and password, as well as the API URL that specifies what data you'd like to 
# see, you're ready to pass those objects to the GET function of httr:
response <- GET(call1)
response <- content(get_prices, as = "parsed")




