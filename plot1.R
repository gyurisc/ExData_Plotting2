setwd("~/ExData_Plotting2/")

if(!"nData" %in% ls())
{
  nData <- readRDS("./data/summarySCC_PM25.rds")  
}

if(!"sourceData" %in% ls())
{
  sourceData <- readRDS("./data/Source_Classification_Code.rds")  
}

png(filename="plot1.png", 
    width=480, height=480,
    bg="white", units = "px")

# Question 1 Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

totalEmission <- aggregate(nData$Emissions, list(nData$year), FUN=sum)
plot(totalEmission, type="l", xlab="Year", main="Total Emissions in the US from 1999 until 2008")
dev.off()

