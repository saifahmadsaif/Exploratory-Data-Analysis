##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


data <- tapply(NEI$Emissions, NEI$year, sum)
data_kilo <- (data/ 1000) 

png("plot1.png")
barplot(data_kilo, xlab = "Year", 
        main = "Total PM2.5 emission (year-wise)",
        ylab = "Total PM2.5 emission in kilo tons",
        col="red","orange", "yellow", "green")
dev.off()