##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset data or baltimore

baltimore <- NEI [ NEI$fips == "24510" & NEI$year <= 2008, ]

data <- tapply (baltimore$Emissions, baltimore$year, sum )

##Plot data

png("plot2.png")

barplot(data, xlab = "Year of Emission",
        main = "Total PM2.5 emission (year-wise) for Baltimore",
        ylab = "Total PM2.5 emission in tons",
        col = c("red","orange","yellow","green"))

dev.off()
