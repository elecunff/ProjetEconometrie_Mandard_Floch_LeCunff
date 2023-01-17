
setwd("~/Fac/M2/Econométrie/Projet")

data <- read.table("qog_eureg_long_nov20.csv", sep = ",", header = TRUE)
data <- data[!is.na(data$eqi_score),]


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

data <- data[,c("eqi_norm_eqi", "eu_d2jan_t", "eu_d3area_t", "eu_b5n_eur_hab", "eu_empl_edltotal",
                "eu_hea_mdoc", "eqi_norm_corrupt", "eu_tour_nshotel", "eu_rac_kil")]
