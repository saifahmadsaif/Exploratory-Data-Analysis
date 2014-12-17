##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Subset data
baltimore <- NEI [ NEI$fips == "24510" & NEI$year <= 2008, ]
table (baltimore$type)


##Plot data
png("plot3.png")
plot3 <- ggplot(baltimore, aes(year, Emissions))
plot3 <- plot3 + geom_bar(stat="identity")
plot3 <- plot3 + ylab(expression("PM 2.5 Emissions (tons)"))
plot3 <- plot3 + ggtitle(expression("Total Baltimore PM2.5 Emissions by Year and Type"))
plot3 <- plot3 + facet_grid(.~type)
plot3

dev.off()

