##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

county <- NEI [ NEI$fips == "24510" |  NEI$fips == "06037", ]

nums <- subset(SCC$SCC, grepl("Mobile", SCC$EI.Sector))

motar <- subset(county, county$SCC %in% nums)

png("plot6.png")

plot6 <- ggplot(motar, aes(year, Emissions))
plot6 <- plot6 + geom_bar(stat="identity")
plot6 <- plot6 + ylab(expression("PM 2.5 Emissions (tons)"))
plot6 <- plot6 + ggtitle(expression("Compare emissions LosAngeles vs Baltimore "))
plot6 <- plot6 + facet_grid (.~fips)
plot6

dev.off()
