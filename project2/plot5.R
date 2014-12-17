##Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI [ NEI$fips == "24510", ]

nums <- subset(SCC$SCC, grepl("Mobile", SCC$EI.Sector))

balveh <- subset(baltimore, baltimore$SCC %in% nums)

png("plot5.png")
plot5 <- ggplot(balveh, aes(year, Emissions))
plot5 <- plot5 + geom_bar(stat="identity")
plot5 <- plot5 + ylab(expression("PM 2.5 Emissions (tons)"))
plot5 <- plot5 + ggtitle(expression("Emissions from motor vehicle sources"))
plot5

dev.off()