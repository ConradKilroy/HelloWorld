#source: https://stackoverflow.com/questions/4090169/elegant-way-to-check-for-missing-packages-and-install-them

quietly_load_R_packages <- function(my_packages)
{
    #check if package is installed
    new_packages <- my_packages[!(my_packages %in% installed.packages()[,"Package"])] 
    if(length(new_packages)) install.packages(new_packages)
    
##install.packages("ggplot2", repos="http://cran.rstudio.com/", dependencies=TRUE)
    
    #check if package is loaded in current environment
    
    for(package_name in my_packages)
    { 
      if (!(package_name %in% loadedNamespaces()))
      {
        suppressPackageStartupMessages(library(package_name, character.only=TRUE, quietly=TRUE))
      }
    }
}


list_of_packages <- c("ggmap","sp","rgdal","rgeos", "ggplot2","leaflet","dplyr", "magrittr", 
                      "readr", "lubridate", "RColorBrewer", "classInt", "maptools", "grid", 
                      "shiny", "plotly", "stringr", "lubridate", "readr", "RODBC", "classInt")

quietly_load_R_packages(list_of_packages)
