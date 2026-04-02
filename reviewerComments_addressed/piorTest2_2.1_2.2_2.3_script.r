## The script contained here corresponds to the data for the paper entitled: 'Otolith shape variation reveals novel stock structure of range-shifting Yellowtail Kingfish Seriola lalandi lalandi in Aotearoa New Zealand'.
## It specifically corresponds to the methods performed in:
##   Section 2.5.2  Prior test 2.1: temporal comparison of 2014 vs 2019 AKW samples.
##   Section 2.5.3  Prior test 2.2: temporal comparison of 2019 vs 2023 CHA samples.
##   Section 2.5.4  Prior test 2.3: temporal comparison of 2019 vs 2021 CEW samples.
##
## NOTE: Prior tests 3 and 4 are run directly from the standardised indices and contours CSV produced during the population-level analysis, as these samples  are already standardised and processed. The shapeR pipeline below applies to  Prior Test 2 (AKW) only.


## POTENTIAL ERROR: the otolith images MUST BE .jpeg ! IF you receive an error telling you that they are not - I recommend using the magick package (install.packages("magick")) to convert them.

rm(list = ls())

library(shapeR)
library(dplyr)
library(stringr)
library(tidyr)
library(purrr)
library(magick)
library(vegan)
library(pairwiseAdonis)

# ============================================================
# PRIOR TEST 2: TEMPORAL COMPARISONS
# ============================================================

# PRIOR TEST 2.1: TEMPORAL COMPARISON — AKW 2014 vs 2019


## Setting up directories ###
base_dir <- "/path/to/otolith_data/priorTest2"
img_dir  <- file.path(base_dir, "priorTest2_otolithImages")
meta_csv <- file.path(base_dir, "priorTest2_std_indicesContours.csv")

shape_dir <- file.path(base_dir, "ShapeAnalysis")
orig_dir  <- file.path(shape_dir, "Original")
fixed_dir <- file.path(shape_dir, "Fixed")

dir.create(shape_dir, showWarnings = FALSE)
dir.create(orig_dir,  showWarnings = FALSE)
dir.create(fixed_dir, showWarnings = FALSE)

meta <- read.csv(meta_csv, stringsAsFactors = FALSE)
meta <- meta %>% filter(!is.na(picname), picname != "")

write.csv(meta,
          file.path(shape_dir, "input_desired_samples.csv"),
          row.names = FALSE)


setwd(shape_dir)
shape <- shapeR(shape_dir, "input_desired_samples.csv")

# Detect and smooth shape outlines.
shape <- detect.outline(shape, threshold = 0.3, write.outline.w.org = FALSE) # Set to TRUE for verification, but...takes significantly longer!!
shape <- smoothout(shape, n = 100)
save(shape, file = "akw_good_verygood_perfectoutlines_smoothed.RData")

# Generate shape coefficients - these are what we use for the shape indices.
shape <- generateShapeCoefficients(shape)
save(shape, file = "akw_good_verygood_perfectoutlines_smoothed_coefficients.RData")

shape  <- enrich.master.list(shape)
master <- getMasterlist(shape) # Add metadata from the master list


## STANDARDISE SHAPE DATA
shape <- stdCoefs(shape, classes = "pop", "length_cm", bonferroni = TRUE)
save(shape, file = "akw_good_verygood_perfectstd_outlines_smoothed_coefficients.RData")
# After standardisation, no coefficients removed.
## We have to extract the std_coefficients specifically, because it doesn't  attach the level/number/etc wavelet with std_ classifier. Basically....
# Raw coefficients – keeps the proper names...
raw_coef <- getWavelet(shape)      # matrix with names like "Ws2_01"
std_coef <- getStdWavelet(shape)   # matrix, *no* names

colnames(std_coef) <- colnames(raw_coef)
shape.data         <- as.data.frame(std_coef) # now has real names
colnames(shape.data) <- paste0("std_", colnames(shape.data))

# Merge with metadata from master list
shape.info          <- getMasterlist(shape)
shape.combined.data <- cbind(shape.info, shape.data)

# Save final shape + metadata table
write.csv(shape.combined.data, file = "shape_combined_data.csv", row.names = FALSE)

## AT THIS POINT....CHECK FOR ALL EXPECTED OTOLITHS BEING PRESENT!

## Select columns that start with std_Ws *and* whose level is ≥ 1
coef_cols <- grep("^std_Ws([1-9]|[1-9][0-9])", # levels 1–99
                  names(shape.combined.data),
                  value = TRUE)

# Extract and coerce to a numeric matrix
coef_mat <- as.matrix(shape.combined.data[, coef_cols])

# Computing Euclidean distance...
dist.mat <- dist(coef_mat, method = "euclidean")

# CAP analysis constrained by Population
shape_df      <- as.data.frame(coef_mat)
shape_df$pop  <- shape.combined.data$pop

# Constrained ordination (CAP)
cap.res <- capscale(dist.mat ~ pop, data = shape_df)

# Permutation tests
anova(cap.res)               # Global significance
anova(cap.res, by = "terms") # Term significance (pop)
anova(cap.res, by = "axis")  # CAP axis significance

## Pairwise PERMANOVA
pairwise_results <- pairwise.adonis(dist.mat, factors = shape_df$pop,
                                    perm = 999, p.adjust.m = "holm")
print(pairwise_results)

dispersion_test <- betadisper(dist.mat, shape_df$pop)
permutest(dispersion_test)

# Tukey's HSD on group dispersions
TukeyHSD(dispersion_test)


# ============================================================
# PRIOR TESTS 2.2 & 2.3: TEMPORAL COMPARISONS — CHA AND CEW
# Uses standardised data from the population-level analysis CSV, as these samples are already processed through the shapeR pipeline. Otherwise, methodology mirrors Prior Test 2 exactly (see section 2.3).
# ============================================================

## Load the standardised population-level data
pop_csv <- "./populationLevelDifferences/populationLevelDifferences_std_indicesContours.csv"
dat     <- read.csv(pop_csv, stringsAsFactors = FALSE)

## Select wavelet coefficient columns (level 1+, excluding level 0 which
## represents a basic ellipse)
coef_cols_pop <- grep("^std_Ws([1-9]|[1-9][0-9])", names(dat), value = TRUE)
cat(sprintf("Using %d wavelet coefficient columns.\n", length(coef_cols_pop)))

## Confirm year breakdown by population before proceeding
cat("Year breakdown by population:\n")
print(table(dat$pop, dat$yr))


# Run temporal CAP + PERMANOVA + PERMDISP for a given population and pair of years.

run_temporal_test <- function(data, coef_cols, pop_name, year1, year2,
                               n_perm = 999) {

  sub     <- data[data$pop == pop_name & data$yr %in% c(year1, year2), ]
  sub$yr  <- as.factor(sub$yr)

  cat(sprintf("\n============================================================\n"))
  cat(sprintf("  %s: %d vs %d\n", pop_name, year1, year2))
  cat(sprintf("============================================================\n"))
  cat("Sample sizes:\n")
  print(table(sub$yr))

  coef_sub <- as.matrix(sub[, coef_cols])
  dist_sub <- dist(coef_sub, method = "euclidean")

  # CAP ordination constrained by year
  cap_res  <- capscale(dist_sub ~ yr, data = sub)

  # PERMANOVA
  cat("\nPERMANOVA:\n")
  perm_res <- adonis2(dist_sub ~ yr, data = sub, permutations = n_perm)
  print(perm_res)

  # PERMDISP (homogeneity of multivariate dispersions)
  cat("\nPERMDISP (homogeneity of dispersion):\n")
  disp_res  <- betadisper(dist_sub, sub$yr)
  perm_disp <- permutest(disp_res, permutations = n_perm)
  print(perm_disp)
}



## Prior Test 2.2: CHA 2019 vs 2023

run_temporal_test(dat, coef_cols_pop,
                  pop_name = "CHA",
                  year1 = 2019, year2 = 2023)


## Prior Test 2.3: CEW 2019 vs 2021
## NOTE: CEW has no 2023 samples; available years are 2019 (n=6) and 2021 (n=9). The small 2019 sample size (n=6) limits power for this comparison, and is acknowledged as a limitation.

run_temporal_test(dat, coef_cols_pop,
                  pop_name = "CEW",
                  year1 = 2019, year2 = 2021)