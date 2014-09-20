setwd("~/ExData_Plotting2/")

if(!"nData" %in% ls())
{
  nData <- readRDS("./data/summarySCC_PM25.rds")  
}

if(!"sourceData" %in% ls())
{
  sourceData <- readRDS("./data/Source_Classification_Code.rds")  
}

png(filename="plot2.png", 
    width=480, height=480,
    bg="white", units = "px")

# Question 2 Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

baltimore <- nData[nData$fips == "24510", ]
totalEmission <- aggregate(baltimore$Emissions, list(baltimore$year), FUN=sum)
plot(totalEmission, type="l", xlab="Year", main="Total Emissions in Baltimore from 1999 until 2008")
dev.off()

