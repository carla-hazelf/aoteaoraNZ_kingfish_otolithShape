# aoteaoraNZ_kingfish_otolithShape

The data contained in this folder corresponds to the data for the paper entitled:
'Otolith shape variation reveals novel stock structure of range-shifting Yellowtail Kingfish Seriola lalandi lalandi in Aotearoa New Zealand'

The otolith images have been converted to black-and-white.
The naming convention for the otoliths go:
[sample]_d = right distal
[sample]_ld = left distal

Data structure is as follows:

priorTest1   - folder containing the information pertaining to Prior test 1: left-right Otolith Asymmetry [standardised shape indices; 29 individuals (58 otoliths total)].

priorTest2 - folder containing the information pertaining to Prior Test 2: temporal comparison of 2014 vs 2019 AKW samples [standardised wavelet coefficients (26 individuals/otoliths total)].

populationLevelDifferences - folder containing the information pertaining to Stock-level differences [standardised shape indices, and standardised wavelet coefficients (112 individuals/otoliths total].

ADDED 04/04/2026 - reviewerComments_addressed - folder containing supplementary scripts (PERMANOVA Power Analysis and additions to priorTest2) in response to concerns regarding sampling size and temporal effects, respectively.

Description of the data and file structure

This dataset was generated as part of a study investigating otolith shape variation and population structure of Yellowtail Kingfish (Seriola lalandi lalandi) in Aotearoa New Zealand. A total of 112 individuals were sampled from five geographically distinct fishing areas across New Zealand waters. Specimens were primarily collected as bycatch from commercial trawl fisheries targeting jack mackerel (sampling areas CHA, AKW, CEW, and SOU), while additional individuals were obtained by recreational angling from the Bay of Plenty East (BPLE).

Sagittal otoliths were extracted onboard by scientific observers. Due to the fragile nature of otoliths, either the left or right otolith was sometimes damaged during extraction; however, paired left and right otoliths were successfully recovered from 29 individuals and used for bilateral asymmetry analyses (priorTest1). All otoliths were imaged at high resolution using a Nikon imaging system coupled with NIS-Elements software and have been converted to black-and-white images for shape analysis.

The dataset supports three complementary experimental analyses: (i) left–right otolith asymmetry using standardised shape indices from paired otoliths (Prior Test 1), (ii) temporal comparison of otolith shape between 2014 and 2019 samples from the AKW region using standardised wavelet coefficients (Prior Test 2), and (iii) population-level stock discrimination across all five sampling areas using both standardised shape indices and wavelet coefficients.

Code/software

All data processing, image-based otolith shape extraction, morphometric analyses, and statistical testing were conducted using the R statistical computing environment (R Foundation for Statistical Computing). All analyses rely exclusively on free and open-source software. The workflows were implemented as reproducible R scripts and are organised to mirror the directory structure of the data repository.

The exact versions of all R packages used in the analytical workflows are provided in the file software_package_versions.csv. The software environment used for this study included the following package versions:

Package Version

shaper 1.0.1

dplyr 1.1.4

tidyr 1.3.1

stringr 1.5.1

purr 1.0.2

vegan 2.6.6.1

pairwiseAdonis 0.4.1

rstatix 0.7.2

car 3.1.3

magick 2.8.5



Files and variables

The following standardized regional codes are used throughout the dataset to designate population origin:
AKW – Auckland West
CEW – Central West
CHA – Challenger Plateau
SOU – Southland
BPLE – Bay of Plenty



Each of the .csv in each of the directories contain the following metadata headings:

key / A unique identifier assigned to each otolith image
folder / The abbreviated sampling region code corresponding to the parent directory in which the otolith image file is stored. Naming convention as required for ShapeR.
picname / The exact filename of the otolith image, excluding file extension.
pop / Population label. 
side / Indicates whether the imaged otolith is from the right or left sagittal pair.
length_cm / The total body length of the individual fish measured in centimetres.
um.px / The micrometre-per-pixel (µm/px) scaling factor derived from microscope calibration.
magnification / The objective magnification used during image acquisition.
light / The illumination intensity used during image capture, expressed as a percentage of maximum output.
cal / The absolute calibration coefficient applied to each image.

Otolith Data Directory Tree
File: otolith_data.zip

Generated on: 2025-12-10 12:38:10.065404

Root directory: otolith_data

Total files: 205



--------------------------------------------

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/388827_03_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/395304_04_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/395844_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/406737_02_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/406737_05_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/406738_02_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/407255_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/407255_04_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/412469_05_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/412469_10_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/422677_01_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/422677_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/422683_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/551939_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/551939_03_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/551939_06_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/551939_07_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/571220_01_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/571220_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/571220_04_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/571220_05_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/571220_06_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/571220_07_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/571220_08_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/571220_09_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/571220_10_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/AW/616215_05_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1510913_2370_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1511206_2372_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1511209_2374_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1511404_2378_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1511405_2377_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1511406_2379_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1511501_2187_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1511601_2188_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1511702_2567_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1513802_2495_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517001_2189_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517101_2191_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517102_2193_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517103_2192_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517201_2194_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517301_2199_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517302_2200_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517701_2550_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517702_2551_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517703_2552_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517704_2553_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517705_2554_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1517801_2578_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/BP/1529301_2340_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/555020_03_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/555020_04_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/555020_05_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/555020_07_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/555020_11_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/555020_12_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/618751_03_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/618751_08_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/618751_11_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/618751_14_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/618753_06_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/618756_01_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/618756_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/618758_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CE/618758_04_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555003_04_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555003_05_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555003_06_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555003_07_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555003_08_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555003_09_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555004_01_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555004_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555004_03_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555004_04_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555004_05_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555004_06_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555004_07_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555004_09_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555004_10_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555018_01_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555018_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555018_03_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555018_04_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/555018_07_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/6829112_05_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/6829112_07_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/6829112_08_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/6829112_17_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/6829112_18_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/6829112_19_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/6829112_20_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/6829112_23_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/682976_01_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/682976_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/682976_07_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/682976_09_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/CH/6928112_01_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/555054_01_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694843_01_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694843_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694843_03_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694844_01_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694844_02_ld.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694845_01_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694845_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694845_03_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694845_04_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694845_05_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694847_02_d.jpg

populationLevelDifferences/populationLevelDifferences_otolithImages/SO/694847_03_ld.jpg

populationLevelDifferences/populationLevelDifferences_script.r

populationLevelDifferences/populationLevelDifferences_std_indicesContours.csv

priorTest1/priorTest1_otolithImages/AW/395844_02_d.jpg

priorTest1/priorTest1_otolithImages/AW/395844_02_ld.jpg

priorTest1/priorTest1_otolithImages/AW/406737_05_d.jpg

priorTest1/priorTest1_otolithImages/AW/406737_05_ld.jpg

priorTest1/priorTest1_otolithImages/AW/407255_04_d.jpg

priorTest1/priorTest1_otolithImages/AW/407255_04_ld.jpg

priorTest1/priorTest1_otolithImages/AW/412469_10_d.jpg

priorTest1/priorTest1_otolithImages/AW/412469_10_ld.jpg

priorTest1/priorTest1_otolithImages/AW/422677_01_d.jpg

priorTest1/priorTest1_otolithImages/AW/422677_01_ld.jpg

priorTest1/priorTest1_otolithImages/AW/422677_02_d.jpg

priorTest1/priorTest1_otolithImages/AW/422677_02_ld.jpg

priorTest1/priorTest1_otolithImages/AW/422683_02_d.jpg

priorTest1/priorTest1_otolithImages/AW/422683_02_ld.jpg

priorTest1/priorTest1_otolithImages/AW/571220_06_d.jpg

priorTest1/priorTest1_otolithImages/AW/571220_06_ld.jpg

priorTest1/priorTest1_otolithImages/AW/571220_08_d.jpg

priorTest1/priorTest1_otolithImages/AW/571220_08_ld.jpg

priorTest1/priorTest1_otolithImages/AW/571220_09_d.jpg

priorTest1/priorTest1_otolithImages/AW/571220_09_ld.jpg

priorTest1/priorTest1_otolithImages/AW/571220_10_d.jpg

priorTest1/priorTest1_otolithImages/AW/571220_10_ld.jpg

priorTest1/priorTest1_otolithImages/CE/555020_07_d.jpg

priorTest1/priorTest1_otolithImages/CE/555020_07_ld.jpg

priorTest1/priorTest1_otolithImages/CE/555020_12_d.jpg

priorTest1/priorTest1_otolithImages/CE/555020_12_ld.jpg

priorTest1/priorTest1_otolithImages/CE/618751_08_d.jpg

priorTest1/priorTest1_otolithImages/CE/618751_08_ld.jpg

priorTest1/priorTest1_otolithImages/CE/618753_06_d.jpg

priorTest1/priorTest1_otolithImages/CE/618753_06_ld.jpg

priorTest1/priorTest1_otolithImages/CH/555003_07_d.jpg

priorTest1/priorTest1_otolithImages/CH/555003_07_ld.jpg

priorTest1/priorTest1_otolithImages/CH/555004_01_d.jpg

priorTest1/priorTest1_otolithImages/CH/555004_01_ld.jpg

priorTest1/priorTest1_otolithImages/CH/555004_03_d.jpg

priorTest1/priorTest1_otolithImages/CH/555004_03_ld.jpg

priorTest1/priorTest1_otolithImages/CH/555004_04_d.jpg

priorTest1/priorTest1_otolithImages/CH/555004_04_ld.jpg

priorTest1/priorTest1_otolithImages/CH/555004_06_d.jpg

priorTest1/priorTest1_otolithImages/CH/555004_06_ld.jpg

priorTest1/priorTest1_otolithImages/CH/555004_09_d.jpg

priorTest1/priorTest1_otolithImages/CH/555004_09_ld.jpg

priorTest1/priorTest1_otolithImages/CH/555004_10_d.jpg

priorTest1/priorTest1_otolithImages/CH/555004_10_ld.jpg

priorTest1/priorTest1_otolithImages/CH/555018_07_d.jpg

priorTest1/priorTest1_otolithImages/CH/555018_07_ld.jpg

priorTest1/priorTest1_otolithImages/CH/6829112_20_d.jpg

priorTest1/priorTest1_otolithImages/CH/6829112_20_ld.jpg

priorTest1/priorTest1_otolithImages/CH/682976_09_d.jpg

priorTest1/priorTest1_otolithImages/CH/682976_09_ld.jpg

priorTest1/priorTest1_otolithImages/SO/694843_03_d.jpg

priorTest1/priorTest1_otolithImages/SO/694843_03_ld.jpg

priorTest1/priorTest1_otolithImages/SO/694845_02_d.jpg

priorTest1/priorTest1_otolithImages/SO/694845_02_ld.jpg

priorTest1/priorTest1_otolithImages/SO/694845_05_d.jpg

priorTest1/priorTest1_otolithImages/SO/694845_05_ld.jpg

priorTest1/priorTest1_otolithImages/SO/694847_02_d.jpg

priorTest1/priorTest1_otolithImages/SO/694847_02_ld.jpg

priorTest1/priorTest1_right_left_pairs_std_indices.csv

priorTest1/priorTest1_script.r

priorTest2/piorTest2_script.r

priorTest2/priorTest2_otolithImages/AW/388827_03_d.jpg

priorTest2/priorTest2_otolithImages/AW/395304_04_ld.jpg

priorTest2/priorTest2_otolithImages/AW/395844_02_d.jpg

priorTest2/priorTest2_otolithImages/AW/406737_02_ld.jpg

priorTest2/priorTest2_otolithImages/AW/406737_05_d.jpg

priorTest2/priorTest2_otolithImages/AW/406738_02_ld.jpg

priorTest2/priorTest2_otolithImages/AW/407255_02_d.jpg

priorTest2/priorTest2_otolithImages/AW/407255_04_d.jpg

priorTest2/priorTest2_otolithImages/AW/412469_05_ld.jpg

priorTest2/priorTest2_otolithImages/AW/412469_10_d.jpg

priorTest2/priorTest2_otolithImages/AW/422677_01_d.jpg

priorTest2/priorTest2_otolithImages/AW/422677_02_d.jpg

priorTest2/priorTest2_otolithImages/AW/422683_02_d.jpg

priorTest2/priorTest2_otolithImages/AW/551939_02_d.jpg

priorTest2/priorTest2_otolithImages/AW/551939_03_d.jpg

priorTest2/priorTest2_otolithImages/AW/551939_06_ld.jpg

priorTest2/priorTest2_otolithImages/AW/551939_07_d.jpg

priorTest2/priorTest2_otolithImages/AW/571220_01_d.jpg

priorTest2/priorTest2_otolithImages/AW/571220_02_d.jpg

priorTest2/priorTest2_otolithImages/AW/571220_04_d.jpg

priorTest2/priorTest2_otolithImages/AW/571220_05_d.jpg

priorTest2/priorTest2_otolithImages/AW/571220_06_d.jpg

priorTest2/priorTest2_otolithImages/AW/571220_07_ld.jpg

priorTest2/priorTest2_otolithImages/AW/571220_08_d.jpg

priorTest2/priorTest2_otolithImages/AW/571220_09_d.jpg

priorTest2/priorTest2_otolithImages/AW/571220_10_d.jpg

priorTest2/priorTest2_std_indicesContours.csv

ReadMe.txt

otolith_data_file_tree.txt

software_package_versions.csv

