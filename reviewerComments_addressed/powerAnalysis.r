
# SIMULATION-BASED POWER ANALYSIS FOR PERMANOVA


library(vegan)
library(ggplot2)

set.seed(42)

dat <- read.csv(
  "populationLevelDifferences/populationLevelDifferences_std_indicesContours.csv",
  stringsAsFactors = FALSE
)

cat("Columns in dataset:\n")
print(names(dat))
cat("\nPopulations present:\n")
print(table(dat$pop))

#  Extract wavelet coefficient columns 
# These should be named std_Ws1_... through std_Ws9_... (level 0 excluded as it represents a basic ellipse)
coef_cols <- grep("^std_Ws([1-9]|[1-9][0-9])", names(dat), value = TRUE)
cat(sprintf("\nFound %d wavelet coefficient columns.\n", length(coef_cols)))

#  Filter out BPLE
dat_excl  <- dat[dat$pop != "BPLE", ]
dat_excl$pop <- droplevels(as.factor(dat_excl$pop))

coef_mat  <- as.matrix(dat_excl[, coef_cols])
pop_vec   <- dat_excl$pop

cat("\nSample sizes after BPLE exclusion:\n")
print(table(pop_vec))

#  Split into per-group matrices for resampling 
groups     <- levels(pop_vec)
group_data <- lapply(groups, function(g) coef_mat[pop_vec == g, , drop = FALSE])
names(group_data) <- groups

#  Simulation parameters 
# Start with n_sim = 99 to test, then increase to 999 for final run..took about ~40 mins to run on local machine.
n_sim        <- 99       # <<< change to 999 for final version
n_perm       <- 999      # PERMANOVA permutations per test
alpha        <- 0.05

# Sample sizes to test
# Actual sizes: SOU=13, CEW=15, AKW=27, CHA=33
sample_sizes <- c(10, 13, 15, 20, 25, 27, 30, 33, 40, 50, 75, 100)

#  Power simulation function 
power_at_n <- function(n, group_data, n_sim, n_perm, alpha) {
  sig_count <- 0
  
  for (i in seq_len(n_sim)) {
    # Resample n from each group
    # replace = TRUE only when n exceeds that group's actual size
    resampled <- lapply(group_data, function(gd) {
      replace <- nrow(gd) < n
      gd[sample(nrow(gd), n, replace = replace), , drop = FALSE]
    })
    
    sim_mat  <- do.call(rbind, resampled)
    sim_pop  <- factor(rep(names(group_data), each = n))
    dist_sim <- dist(sim_mat, method = "euclidean")
    
    result <- adonis2(dist_sim ~ sim_pop, permutations = n_perm)
    p_val  <- result$`Pr(>F)`[1]
    
    if (!is.na(p_val) && p_val < alpha) sig_count <- sig_count + 1
  }
  
  return(sig_count / n_sim)
}

#  Run across sample sizes 
cat("\nRunning power simulation...\n")
cat("(With n_sim =", n_sim, "- increase to 999 for final run)\n\n")

power_results <- data.frame(
  n_per_group = sample_sizes,
  power       = NA_real_
)

for (j in seq_along(sample_sizes)) {
  n <- sample_sizes[j]
  cat(sprintf("  Testing n = %d per group...\n", n))
  power_results$power[j] <- power_at_n(n, group_data, n_sim, n_perm, alpha)
}

cat("\nResults:\n")
print(power_results)

# Save results to CSV
write.csv(power_results,
          "populationLevelDifferences/power_analysis_results.csv",
          row.names = FALSE)

#  Plot...requires refining/editing in inkscape, no surprise there!
actual_sizes <- data.frame(
  n    = c(13, 15, 27, 33),
  lab  = c("SOU\n(n=13)", "CEW\n(n=15)", "AKW\n(n=27)", "CHA\n(n=33)")
)

p <- ggplot(power_results, aes(x = n_per_group, y = power)) +
  geom_line(linewidth = 1, colour = "#2C7BB6") +
  geom_point(size = 3, colour = "#2C7BB6") +
  geom_hline(yintercept = 0.80, linetype = "dashed",
             colour = "red", linewidth = 0.8) +
  geom_vline(data = actual_sizes, aes(xintercept = n),
             linetype = "dotted", colour = "grey50") +
  geom_text(data = actual_sizes,
            aes(x = n, y = 0.04, label = lab),
            size = 2.8, colour = "grey40", vjust = 0) +
  annotate("text", x = 85, y = 0.82,
           label = "80% power threshold", colour = "red", size = 3.2) +
  scale_y_continuous(limits = c(0, 1),
                     labels = scales::percent_format(accuracy = 1)) +
  scale_x_continuous(breaks = sample_sizes) +
  labs(
    title    = "Simulation-based power analysis — PERMANOVA on wavelet coefficients",
    subtitle = "Four groups (AKW, CEW, CHA, SOU); BPLE excluded; α = 0.05",
    x        = "Sample size per group (equal resampling)",
    y        = "Estimated power"
  ) +
  theme_classic(base_size = 13) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(p)

ggsave("populationLevelDifferences/power_analysis_PERMANOVA.png",
       plot = p, width = 8, height = 5, dpi = 300)

cat("\nDone. Plot and CSV saved to populationLevelDifferences/\n")