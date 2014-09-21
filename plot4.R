setwd("~/ExData_Plotting2/")

if(!"nData" %in% ls())
{
  nData <- readRDS("./data/summarySCC_PM25.rds")  
}

if(!"sourceData" %in% ls())
{
  sourceData <- readRDS("./data/Source_Classification_Code.rds")  
}

# Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999???2008?

png(filename="plot4.png", 
    width=480, height=480,
    bg="white", units = "px")

coal <- grep("coal", sourceData$Short.Name, ignore.case=T)
coalSource <- sourceData[coal, ]
coalData <- nData[nData$SCC %in% coalSource$SCC, ]
coalEmission <- aggregate(coalData$Emissions, list(coalData$year), FUN="sum")

plot(coalEmission, type="l", xlab="Year", main="Coal Emission in US from 1999 until 2008")

dev.off()

