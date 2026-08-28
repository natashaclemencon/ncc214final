## Recreating Figure 3 of "Effects of hurricane disturbance on stream water concentrations and fluxes in eight tropical forest watersheds of the Luquillo Experimental Forest, Puerto Rico" by Schaefer et al. 

# Purpose
This repository serves to recreate Figure 3 of the paper "Effects of hurricane disturbance on stream water concentrations and fluxes in eight tropical forest watersheds of the Luquillo Experimental Forest, Puerto Rico" using the author's data stored at https://doi.org/10.6073/PASTA/F31349BEBDC304F758718F4798D25458. Recreating this project requires downloading this data, as well as the tidyverse library. 

## Organization
# Data: 
* All dataframes from the above DOI are stored in the folder titled data/knb-lter-luq.20.4923064.
* Recreating their Figure 3 is accomplished using the only dataframes QuebradaCuenca1-Bisley, QuebradaCuenca2-Bisley, QuebradaCuenca3-Bisley, and RioMameyesPuenteRoto. 
* These data frames are accessed and cleaned in my 1_clean_data R script

# Analyses: 
* The movingaverage R script contains the function to find the moving averages for the data frame for each collection site.
* The 1_clean_data R script contains the code that binds the moving averages of all four collection sites into one dataframe, titled alldata.
* Figure 3 was created in paper.qmd using all data output, which was saved as it's own csv.  

* Drafts of all aforementioned code was initially done in the spaghetti script in my scratch folder

## Contributions and References
# Contributors: 
Natasha Clemencon-Charles
Priscilla Pierce
Veronica Moran

# References:
Schaefer, Douglas. A., William H. McDowell, Fredrick N. Scatena, and Clyde E. Asbury. 2000. “Effects of Hurricane Disturbance on Stream Water Concentrations and Fluxes in Eight Tropical Forest Watersheds of the Luquillo Experimental Forest, Puerto Rico.” Journal of Tropical Ecology 16 (2): 189–207. https://doi.org/10.1017/s0266467400001358.


