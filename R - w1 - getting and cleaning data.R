# .............. getting and cleaning data - Week 1 .................. #

setwd("/Volumes/LIEU TRAN Apr 2018/PROJECTS LIEU TRAN/R/R coursera/R - Getting cleaning data course/R - Exercises")
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = '/Volumes/LIEU TRAN Apr 2018/PROJECTS LIEU TRAN/R/R coursera/R - Getting cleaning data course/R - Exercises/UScommunity.csv', method = 'curl')
dateDownloaded <- date()
UScommu <- read.csv("UScommunity.csv", header = T)

dim(UScommu)
head(UScommu)
tail(UScommu)

sum(is.na(UScommu))
#           How many properties are worth $1,000,000 or more?
length(which(UScommu$VAL == 24)) #53
str(UScommu$FES)
table(UScommu$FES)



library(xlsx)
fileURL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL2, destfile = '/Volumes/LIEU TRAN Apr 2018/PROJECTS LIEU TRAN/R/R coursera/R - Getting cleaning data course/R - Exercises/Gas.xlsx', method = 'curl')
dateDownloaded <- date()
Gas <- data.frame(read_xlsx('/Volumes/LIEU TRAN Apr 2018/PROJECTS LIEU TRAN/R/R coursera/R - Getting cleaning data course/R - Exercises/Gas.xlsx', sheet = 1, col_names = TRUE))
dim(Gas)
head(Gas)
dat <- data.frame(Gas[18:23, 7:15])

head(dat)
dim(dat)
names(dat) <- c("Zip", "CuCurrent", "PaCurrent", "PoCurrent", "Contact", "Ext", "Fax email Status")
sum(dat$Zip*dat$Ext,na.rm=T)

sum(as.numeric(dat$Zip)*as.numeric(dat$Ext),na.rm=T)



# .............. How many restaurants have zipcode 21231?
library(XML)
fileURL3 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
Rest <- xmlTreeParse(fileURL3, useInternal = T)
rootNode <- xmlRoot(Rest)
xmlName(rootNode)
names(rootNode)
rootNode[[1]][[1]]
zip <- xpathSApply(rootNode, "//zipcode", xmlValue)
table(zip)
length(zip[zip == 21231])  #127

# 
fileURL4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL4, destfile = "/Volumes/LIEU TRAN Apr 2018/PROJECTS LIEU TRAN/R/R coursera/R - Getting cleaning data course/R - Exercises/ACS.xlsx", method = "curl")
download.file(fileURL4, destfile = paste(getwd(),"/ACS1.xlsx", sep = ""), method = "curl")

ACS <- read.csv("ACS.xlsx", header = T)
head(ACS)
dim(ACS)

#        using the fread() command load the data into an R object
library(data.table)
DT <- fread("ACS.xlsx")
head(DT)













