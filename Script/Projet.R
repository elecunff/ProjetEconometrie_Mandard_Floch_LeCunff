library(dplyr)


data <- read.table("./Data/qog_eureg_long_nov20.csv", sep = ",", header = TRUE)
data <- data[!is.na(data$eqi_score),]

data[,"year"]
data[,"region_name"]
data[,"eu_d2jan_t"] #pop
data[,"eu_d3area_lat"] #surface
data[,"eu_d3area_t"] #surface
data[,"eqi_score"] #EQI
data[,"eqi_norm_eqi"] #EQI normalisé
data[,"eu_b5n_eur_hab"] #revenu par habitant
data[,"eu_empl_edltotal"] #taux d'emploi
data[,"eu_hea_mdoc"] #medecin par milleir d'habtiants
data[,"eqi_norm_corrupt"] #corruption normalisé
data[,"eu_tour_nshotel"] #nuits passees dans hotel ou autre
data[,"eu_rac_kil"] #victimes accidents de la route

data <- data[,c("cname", "region_name", "year", "eqi_norm_eqi", "eu_d2jan_t", "eu_d3area_t", "eu_b5n_eur_hab", "eu_empl_edltotal",
                "eu_hea_mdoc", "eqi_norm_corrupt", "eu_tour_nshotel", "eu_rac_kil")]

nrow(data)

table(data$year)

df <- data[,c("region_name", "year", "eu_d3area_t")]
df <- df %>% filter(year == 2013)
df["year"] <- 2017

data <- data %>% left_join(df, 
           by=c('region_name'))

data <- data %>% select(region_name,year.x,eqi_norm_eqi,eu_d2jan_t,eu_d3area_t.y,eu_b5n_eur_hab,
                        eu_empl_edltotal,eu_hea_mdoc,eqi_norm_corrupt,eu_tour_nshotel,eu_rac_kil)

summary(data)

sum(is.na(data$eu_d3area_t.y))

data <- data %>% filter(!is.na(data$eu_d3area_t.y)) %>%
                select(-eu_hea_mdoc)

table(data$year)


data[is.na(data$eu_empl_edltotal),7] <- median(data$eu_empl_edltotal, na.rm = T)
data[is.na(data$eu_tour_nshotel),9] <- median(data$eu_tour_nshotel, na.rm = T)

summary(data)

data <- na.omit(data)

table <- data.frame(table(data$region_name))

reg_sup <- table[table$Freq != 3,1]
reg_sup

data <- data[!(data$region_name %in% reg_sup),]

table(data$year)
