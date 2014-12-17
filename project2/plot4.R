##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")



nums <- subset(SCC$SCC, grepl("Coal", SCC$EI.Sector))

coal <- subset(NEI, NEI$SCC %in% nums)

png("plot4.png")
plot4 <- ggplot(coal, aes(year, Emissions))
plot4 <- plot4 + geom_bar(stat="identity")
plot4 <- plot4 + ylab(expression("PM 2.5 Emissions (tons)"))
plot4 <- plot4 + ggtitle(expression("Emissions from coal combustion-related sources year wise"))
plot4

dev.off()
