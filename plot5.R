setwd("~/ExData_Plotting2/")

if(!"nData" %in% ls())
{
  nData <- readRDS("./data/summarySCC_PM25.rds")  
}

if(!"sourceData" %in% ls())
{
  sourceData <- readRDS("./data/Source_Classification_Code.rds")  
}

# Question 5
# How have emissions from motor vehicle sources changed from 1999???2008 in Baltimore City?

png(filename="plot5.png", 
    width=480, height=480,
    bg="white", units = "px")

baltimore <- nData[nData$fips == "24510", ]
motor <- grep("motor", sourceData$Short.Name, ignore.case="T")
motorSource <- sourceData[motor, ]
motorData <- baltimore[baltimore$SCC %in% motorSource$SCC,]
motorEmission <- aggregate(motorData$Emissions, list(motorData$year), FUN="sum")

plot(motorEmission, type="l", xlab="Year", main="Motor Vehicle Emission in Baltimore")

dev.off()