## Part 1: Climate data extraction and analysis
{
#Download PRISM files prior to running script
#Climate data extraction
library(raster)

#Create site data
site<-c("IP", "LI","MG","APC", "ER", "RMBL", "DL", "DC","SR", "PL", "LL", "PP", "CT", "E", "TC","CC")
lon<-c(-106.6037, -107.09681, -106.99807,-106.99618, -106.99367,
       -106.98928,-106.97622, -106.97875, -106.8866, -107.0008, 
       -107.0081, -106.8897, -106.86909, -106.8717, -106.90602, -106.972036)
lat<-c(39.106394, 38.858439,38.975531, 38.973753, 38.965367, 38.9582,
       38.945367, 38.94545, 38.9064, 38.8821, 38.8948, 38.8957, 38.822082, 
       38.7301, 38.53914, 38.962864)
samples<-data.frame(site, lon, lat, row.names="site")
elev <- c(3331, 3010, 2937, 2918, 2912, 2885, 2873, 2866, 2907, 
          2704, 2723, 2789, 2695, 2527, 2337, 3040)

#June Mean Temperature


tmean20<-raster("PRISM_tmean_stable_4kmM3_202006_bil.bil")
tmean21<-raster("PRISM_tmean_stable_4kmM3_202106_bil.bil")
tmean22<-raster("PRISM_tmean_stable_4kmM3_202206_bil.bil")
tmean23<-raster("PRISM_tmean_stable_4kmM3_202306_bil.bil")

#Extract data from the rasters
tmeanJune20<-extract(tmean20,samples)
tmeanJune21<-extract(tmean21,samples)
tmeanJune22<-extract(tmean22,samples)
tmeanJune23<-extract(tmean23,samples)

temp_df <-rbind(
  data.frame(Site = 1:length(tmeanJune20), Elevation = elev, 
             Year = 2020, Temp = tmeanJune20),
  data.frame(Site = 1:length(tmeanJune21),  Elevation = elev,    
             Year = 2021,   Temp = tmeanJune21),
  data.frame(Site = 1:length(tmeanJune22),  Elevation = elev,  
             Year = 2022,  Temp = tmeanJune22),
  data.frame(Site = 1:length(tmeanJune23),  Elevation = elev,  
             Year = 2023,  Temp = tmeanJune23))
  
write.csv(temp_df, "Iris_20_23_PRISM_temp.csv")

#precip
precip206<-raster("~/Documents/PRISM_data/NewPRISM/prism_ppt_us_30s_202006.tif")
precip216<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202106.tif")
precip226<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202206.tif")
precip236<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202306.tif")

precip205<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202005.tif")
precip215<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202105.tif")
precip225<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202205.tif")
precip235<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202305.tif")

precip204<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202004.tif")
precip214<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202104.tif")
precip224<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202204.tif")
precip234<-raster("~/Documents/PRISM_data/NewPRISM/PRISM_ppt_us_30s_202304.tif")

precipJune20<-extract(precip206,samples)
precipJune21<-extract(precip216,samples)
precipJune22<-extract(precip226,samples)
precipJune23<-extract(precip236,samples)

precipMay20<-extract(precip205,samples)
precipMay21<-extract(precip215,samples)
precipMay22<-extract(precip225,samples)
precipMay23<-extract(precip235,samples)

precipApril20<-extract(precip204,samples)
precipApril21<-extract(precip214,samples)
precipApril22<-extract(precip224,samples)
precipApril23<-extract(precip234,samples)

precip_df <-rbind(
  data.frame(Site = 1:length(precipApril20), Elevation = elev, 
             Year = 2020, Month = "April", Precip = precipApril20),
  data.frame(Site = 1:length(precipMay20),  Elevation = elev,    
             Year = 2020, Month = "May",   Precip = precipMay20),
  data.frame(Site = 1:length(precipJune20),  Elevation = elev,  
             Year = 2020, Month = "June",  Precip = precipJune20),
  
  data.frame(Site = 1:length(precipApril21),  Elevation = elev,  
             Year = 2021, Month = "April", Precip = precipApril21),
  data.frame(Site = 1:length(precipMay21),  Elevation = elev,   
             Year = 2021, Month = "May",   Precip = precipMay21),
  data.frame(Site = 1:length(precipJune21),  Elevation = elev,  
             Year = 2021, Month = "June",  Precip = precipJune21),
  
  data.frame(Site = 1:length(precipApril22), Elevation = elev,  
             Year = 2022, Month = "April", Precip = precipApril22),
  data.frame(Site = 1:length(precipMay22),  Elevation = elev,   
             Year = 2022, Month = "May",   Precip = precipMay22),
  data.frame(Site = 1:length(precipJune22),  Elevation = elev,  
             Year = 2022, Month = "June",  Precip = precipJune22),
  
  data.frame(Site = 1:length(precipApril23),  Elevation = elev,  
             Year = 2023, Month = "April", Precip = precipApril23),
  data.frame(Site = 1:length(precipMay23),  Elevation = elev,   
             Year = 2023, Month = "May",   Precip = precipMay23),
  data.frame(Site = 1:length(precipJune23),  Elevation = elev,  
             Year = 2023, Month = "June",  Precip = precipJune23))

write.csv(precip_df, "Iris_20_23_PRISM_precip.csv")

#Analyses of climate data
library(lmer)
library(ggplot2)
library(car)
library(patchwork)
library(emmeans)

#load data
precip <- read.csv("Iris_20_23_PRISM_precip.csv")
temp <- read.csv("Iris_20_23_PRISM_temp.csv")

#Run precipitation model
precip$Month <- factor(precip$Month, levels = c("April", "May", "Jun"))
precip$Year <- factor(precip$Year)
precipitation <- lmer(Precip ~ Elevation * Year * Month + (1|site), data = precip)
Anova(precipitation, type = "III")

#Run temperature model
temp$Year <- factor(Temp$Year)
temperature <- lmer(Temp ~ Elevation * Year + (1|site), data = temp)
Anova(temperature, type="III")

#Create plots

t <- ggplot(temperature, aes(x = Elevation, y = Temp, color = Year)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE)+
  theme_classic() +
  labs(x = "Elevation", y = "Average June Temperature") +
  theme(axis.text = element_text(size = 12))
p <- ggplot(precipitation, aes(x = Elevation, y = Precip, color = Year)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = FALSE) +
  facet_wrap(~ month) +
  theme_classic() +
  labs(x = "Elevation", y = "Precipitation") +
  theme(legend.position = "none", axis.text = element_text(size = 12))

(p|t)+ plot_annotation(tag_levels = 'A')

#Post hoc tests
emmeans(Precip, pairwise ~ Year|Elevation|Month)

emmeans(Temp, pairwise ~ Year|Elevation)

}

## Part 2: Clinal trait data analyses
{
#Required file: Iris_data.txt
library(lmer)
library(car)
library(visreg)
library(emmeans)
library(DHARMa)

#Load data
Iris <- read.delim("Iris_data.txt", header=TRUE)

#Scale variables
Iris$FloralA <- c(scale(Iris$Floral_area,center=TRUE, scale=TRUE))
Iris$elev <- c(scale(Iris$elevation,center=TRUE, scale=TRUE))
Iris$Year <- as.character(Iris$Year)

#Run model
FloralA_elev <- lmer(FloralA ~ elev * Year + (1|site), data = Iris)
Anova(FloralA_elev, type = "III")

#Check Residuals
FloralA_residuals <- simulateResiduals(FloralA_elev)
plot(FloralA_residuals)

#Plot model
visreg(FloralA_elev, ylab="Floral Area", xvar="elevation", by="Year", 
       gg=TRUE, overlay=TRUE, partial=TRUE, band=TRUE) + theme_classic() + 
  theme(axis.text = element_text(size = 12), axis.title = 
          element_text(size = 12))



#Posthoc test
emtrends(FloralA_elev, pairwise ~ Year, var = "elevation")

}

## Part 3: Iris microsatellite genotyping
{
  library(Biostrings)
  library(DECIPHER)
  library(parallel)
  library(hierfstat)
  library(dartR)
  library(corrplot)
  
  IEST12 <- readDNAStringSet("IrisDNAIEST12.fasta")
  IEST24 <- readDNAStringSet("IrisDNAIEST24.fasta")
  TrnL <- readDNAStringSet("IrisDNATrnL.fasta")
  
  #Run the alignments
  alignmentIEST12 <- AlignSeqs(IEST12)
  alignmentIEST24 <- AlignSeqs(IEST24)
  alignmentTrnL <- AlignSeqs(TrnL)
  
  writeXStringSet(alignmentIEST12, "IEST12_aligned.fasta")
  writeXStringSet(alignmentIEST24, "IEST24_aligned.fasta")
  writeXStringSet(alignmentTrnL, "TrnL_aligned.fasta")
  
  #Create a genlight object
  genlight12<- fasta2genlight("IEST12_aligned.fasta", chunkSize = 100, 
                              parallel = TRUE, n.cores = 5)
  genlight24<- fasta2genlight("IEST24_aligned.fasta", chunkSize = 100, 
                              parallel = TRUE, n.cores = 5)
  genlightTrnL<- fasta2genlight("TrnL_aligned.fasta", chunkSize = 100, 
                                parallel = TRUE, n.cores = 5)
  
  #Find number of clusters with DAPC
  num_clust <- find.clusters(genlightTrnL)

  num_clust24 <- find.clusters(genlight24)
  
  num_clust12 <- find.clusters(genlight12)
  
  IEST24_DAPC<- dapc(genlight24,num_clust24$grp)
  IEST12_DAPC<- dapc(genlight12,num_clust12$grp)
  TrnL_DAPC<- dapc(genlightTrnL,num_clust$grp)
  
  #Add population to the DAPC dataframe
  pops <- read.csv("TrnLpops.csv")
  
  dapc_data_df <-
    as_tibble(TrnL_DAPC$ind.coord, rownames = "individual") %>%
    mutate(population = pops$Population,
           group = TrnL_DAPC$grp)
  
  write.csv(dapc_data_df, file = "dapc_TrnL.csv")
  #admixture plots
  {#IEST12
    #Dataframe of posterior probabilities with names and elevations
    post12 <- as.data.frame(IEST12_DAPC$posterior)
    post12$individual <- rownames(post12)
    post12$elevation <- as.factor(dapc_IEST12$elevation)
    
    #Convert to long format
    post12_long <- pivot_longer(post12, 
                                cols = 1:ncol(IEST12_DAPC$posterior),
                                names_to = "cluster", 
                                values_to = "probability")
    
    #Order by elevation
    ordered_inds <- post12$individual[order(post12$elevation)]
    
    post12_long$individual <- factor(post12_long$individual,
                                     levels = ordered_inds)
    # Plot
    plot12 <- ggplot(post12_long,
                     aes(x = individual, y = probability, fill = cluster)) +
      geom_bar(stat = "identity", width = 1) +
      facet_grid(~elevation,scales = "free_x", space = "free_x") +
      theme_bw(base_size = 14) +
      labs(y = "Assignment probability", x = "Individuals") +
      theme( axis.text.x = element_blank(),
             axis.ticks.x = element_blank(),
             panel.spacing = unit(0.1, "lines"),
             strip.background = element_blank(),
             strip.text = element_text(face = "bold"))
  }
  {#IEST24
    #Dataframe of posterior probabilities with names and elevations
    post24 <- as.data.frame(IEST24_DAPC$posterior)
    post24$individual <- rownames(post24)
    post24$elevation <- as.factor(dapc_IEST24$elevation)
    
    #Convert to long format
    post24_long <- pivot_longer(post24, 
                                  cols = 1:ncol(IEST24_DAPC$posterior),
                                  names_to = "cluster", 
                                  values_to = "probability")
    
    #Order by elevation
    ordered_inds <- post24$individual[order(post24$elevation)]
    
    post24_long$individual <- factor(post24_long$individual,
                                       levels = ordered_inds)
    # Plot
    plot24 <- ggplot(post24_long,
                       aes(x = individual, y = probability, fill = cluster)) +
      geom_bar(stat = "identity", width = 1) +
      facet_grid(~elevation,scales = "free_x", space = "free_x") +
      theme_bw(base_size = 14) +
      labs(y = "Assignment probability", x = "Individuals") +
      theme( axis.text.x = element_blank(),
             axis.ticks.x = element_blank(),
             panel.spacing = unit(0.1, "lines"),
             strip.background = element_blank(),
             strip.text = element_text(face = "bold"))
  }
  {#TrnL
    #Dataframe of posterior probabilities with names and elevations
    postTrnL <- as.data.frame(TrnL_DAPC$posterior)
    postTrnL$individual <- rownames(postTrnL)
    postTrnL$elevation <- as.factor(dapc_TrnL$elevation)
    
    #Convert to long format
    postTrnL_long <- pivot_longer(postTrnL, 
                                  cols = 1:ncol(TrnL_DAPC$posterior),
                                  names_to = "cluster", 
                                  values_to = "probability")
    
    #Order by elevation
    ordered_inds <- postTrnL$individual[order(postTrnL$elevation)]
    
    postTrnL_long$individual <- factor(postTrnL_long$individual,
                                       levels = ordered_inds)
    # Plot
    plotTrnL <- ggplot(postTrnL_long,
                       aes(x = individual, y = probability, fill = cluster)) +
      geom_bar(stat = "identity", width = 1) +
      facet_grid(~elevation,scales = "free_x", space = "free_x") +
      theme_bw(base_size = 14) +
      labs(y = "Assignment probability", x = "Individuals") +
      theme( axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        panel.spacing = unit(0.1, "lines"),
        strip.background = element_blank(),
        strip.text = element_text(face = "bold"))
  }

  #Calculating Fst for IEST12 and IEST24
  pop(genlight12) <- dapc_IEST12$elevation
  pop(genlight24) <- dapc_IEST24$elevation
  
  #genlight to genind format
  genind12 <- gl2gi(genlight12)
  genind24 <- gl2gi(genlight24)
  
  #Then genind to hierfstat format
  hf12 <- genind2hierfstat(genind12)
  hf24 <- genind2hierfstat(genind24)

  #Calculate pairwise Fst
  IEST12Fst <- pairwise.WCfst(hf12)
  IEST24Fst <- pairwise.WCfst(hf24)
  
  #Write Fst files
  write.csv(IEST12Fst, file = "IEST12Fst.csv")
  write.csv(IEST24Fst, file = "IEST24Fst.csv")
 
  #Plotting pairwise Fst, first create a matrix, then use corrplot
  mat12 <- as.matrix(IEST12Fst)
  mat24 <- as.matrix(IEST24Fst)
  corrplot(mat12,
           method = "color",
           col = colorRampPalette(c("white", "white", "purple"))(100),
           type = "upper",      
           order = "original",   
           addCoef.col = "black",
           number.cex = 0.8,
           tl.col = "black",  
           tl.srt = 45,   
           cl.pos = "r",          
           diag = FALSE)            
  corrplot(mat24,
           method = "color",
           col = colorRampPalette(c("white", "white", "purple"))(100),
           type = "upper",    
           order = "original",  
           addCoef.col = "black",
           number.cex = 0.8,
           tl.col = "black",      
           tl.srt = 45,     
           cl.pos = "r",    
           diag = FALSE) 
  
}

## Part 4: Artificial flower visitations
{
#Comparison of natural and artificial flower communities
 #required data file: poll_an.csv
   library(vegan)
  #load data
  pollcomp <- read.csv("poll_an.csv", row.names=1)
  
  #Create matrix
  pollmat <- as.matrix(pollcomp)
  
  #Rarefy to minimum sample size
  min_count <- min(rowSums(pollmat))
  poll_rare <- rrarefy(poll_mat , min_count)
  
  #Assign flower types
  flower_type <- factor(rep(c("Real", "Artificial"), each = nrow(polldiss) / 2))
  
  #Create Bray-Curtis dissimilarity matrix
  polldiss <- vegdist(poll_rare, method="bray")
  
  #PERMANOVA
  permpoll <- adonis2(polldiss ~ flower_type, permutation = 200)
  
#Analyses of artificial floral arrays
  #Required data file: AFA_data.csv
  library(glmmTMB)
  library(car)
  library(ggeffects)
  library(ggplot2)
  library(emmeans)
  library(DHARMa)
  
  # Load data file
  poll <- read.csv("~/Desktop/AFA_manuscript/AFA_data.csv")
  
  #Scale variables
  SD <- c(scale(poll$Sizediff,center=TRUE, scale=TRUE))
  Elev <- c(scale(poll$Elevation,center=TRUE, scale=TRUE))
  Yr <- c(scale(poll$Year,center=TRUE, scale=TRUE))
  
  #Run model
  pollmodel <- glmmTMB(Visits ~ SD * Yr + I(SD^2)+ Elev, 
                       data = poll, 
                       family = nbinom2)
  Anova(pollmodel, type= 'III')
  
  #Check Residuals
  pollresiduals <- simulateResiduals(pollmodel)
  plot(pollresiduals)
  
  #Post hoc tests
  emmeans(pollmodel, pairwise ~ Year)
  
  #Plotting data
  pred_SD <- ggpredict(pollmodel, terms = "Sizediff [all]")
  
  ggplot() +
    geom_point(data = poll,
               aes(x = Sizediff, y = Visits), alpha = 0.3) +
    geom_line(data = pred_SD,
              aes(x = x, y = predicted), linewidth = 1.2) +
    geom_ribbon(data = pred_SD,
                aes(x = x, ymin = conf.low, ymax = conf.high), 
                fill = "purple", alpha = 0.2) +
    labs(x = "Difference from average natural flower size",
         y = "Number of pollinator visits") +
    theme_classic() +
    theme(axis.text = element_text(size = 12), axis.title = 
            element_text(size = 15))
  
  ## Replicate for only "likely" pollinators (i.e. bees, butterflies, and hummingbirds)
  #Required data file: AFA_data_likelypoll.csv
  library(glmmTMB)
  library(car)
  library(ggeffects)
  library(ggplot2)
  library(emmeans)
  library(DHARMa)
  
  # Load data file
  polllikely <- read.csv("~/Desktop/AFA_manuscript/AFA_data_likelypoll.csv")
  
  #Scale variables
  SD <- c(scale(polllikely$Sizediff,center=TRUE, scale=TRUE))
  Elev <- c(scale(polllikely$Elevation,center=TRUE, scale=TRUE))
  Yr <- c(scale(polllikely$Year,center=TRUE, scale=TRUE))
  
  #Run model
  pollmodellikely <- glmmTMB(Visits ~ SD * Yr + I(SD^2) + Elev, 
                       data = polllikely, 
                       family = nbinom2)
  Anova(pollmodellikely, type= 'III')

  #Check Residuals
  polllikelyresiduals <- simulateResiduals(pollmodellikely)
  plot(polllikelyresiduals)
  testDispersion(polllikelyresiduals)
  
  #Post hoc tests
  emmeans(pollmodellikely, specs = ~Sizediff)
  
  #Plotting data
  pred_SDlikely <- ggpredict(pollmodellikely, terms = "Sizediff [all]")
  
  ggplot() +
    geom_point(data = polllikely,
               aes(x = Sizediff, y = Visits), alpha = 0.3) +
    geom_line(data = pred_SDlikely,
              aes(x = x, y = predicted), linewidth = 1.2) +
    geom_ribbon(data = pred_SDlikely,
                aes(x = x, ymin = conf.low, ymax = conf.high), 
                fill = "purple", alpha = 0.2) +
    labs(x = "Difference from average natural flower size",
         y = "Number of visits of likely pollinators") +
    theme_classic() +
    theme(axis.text = element_text(size = 12), axis.title = 
            element_text(size = 15), plot.margin = margin
          (t = 10, r = 10, b = 10, l = 10))
  
}
