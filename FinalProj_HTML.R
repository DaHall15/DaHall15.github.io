#Danielle Hall
#November 2023

# With this rscipt, all map visualizations will be created
# Statistical charts will be able to be created 
# Using the "htmlwidget" package, the script will be able to be exported 
#and shown in web browser
# GGplot will be used to create plots

### Installing all the required packages
install.packages("htmlwidgets") #exporting html
install.packages("terra") #working with vector data
install.packages("sf") #working with vector data
install.packages("sp") #working with vector data
install.packages("ggplot2") #plotting data
install.packages("leaflet") #working with leaflet
install.packages("rjson") #package to read in json files to R
install.packages("rgdal")
install.packages("shiny")

### Opening the packages
library(leaflet)
library(htmlwidgets)
library(terra)
library(sf)
library(sp)
library(ggplot2)
library(rjson)
library(shiny)

## helpful links
#https://stackoverflow.com/questions/30110377/saving-leaflet-output-as-html
#https://rstudio.github.io/leaflet/morefeatures.html
# Reading json files into R: https://www.educative.io/answers/how-to-read-json-files-in-r 
# Reading JSON files through GitHub: https://www.youtube.com/watch?v=hGzlvSIhvIc 

# Linked in Learning course to use htmlwidgets: https://www.linkedin.com/learning/r-interactive-visualizations-with-htmlwidgets/create-interactive-choropleth-maps-2?autoSkip=true&resume=false&u=72020170

######### Creating the map #################
## Reading in all of the data

## This will allow us to read in the JSONs and develop the maps in leaflet

#Need to go back and project layers to make sure all geojsons projected in WGS 1984


avePM25 <- fromJSON(file = "D:/DHall_Portfolio/HERO_Map/JSON_files/AverageDAily_PM25/AveragePM25_WGS1984.geojson", simplify = TRUE) #simplify will keep it form converting to vector
EJ_neigh <- fromJSON(file = "D:/DHall_Portfolio/HERO_Map/JSON_files/AverageDAily_PM25/EJ_neighborhoods.geojson", simplify = TRUE)
Prov_ct <- fromJSON(file = "D:/DHall_Portfolio/HERO_Map/JSON_files/AverageDAily_PM25/ProvCensusTract_WGS1984.geojson", simplify = TRUE)
RI_ct <- fromJSON(file = "D:/DHall_Portfolio/HERO_Map/JSON_files/AverageDAily_PM25/RI_CensusTracts_WGS1984.geojson", simplify = TRUE)
Route95 <- fromJSON(file = "D:/DHall_Portfolio/HERO_Map/JSON_files/AverageDAily_PM25/Route95_WGS1985.geojson", simplify = TRUE)
Prov_bounds <- fromJSON(file = "D:/DHall_Portfolio/HERO_Map/JSON_files/AverageDAily_PM25/Prov_boundary_WGS1984.geojson", simplify = TRUE)
PM25_sensors <- fromJSON(file = "D:/DHall_Portfolio/HERO_Map/JSON_files/AverageDAily_PM25/PM25_Sensors.geojson", simplify = TRUE)
PM25_neigh <- fromJSON(file = "D:/DHall_Portfolio/HERO_Map/JSON_files/PM25_Neighborhoodnames_WGS1984.geojson")

library(leaflet) ##This is where I'd add my data

# Adding layers to leaflet map called "studyarea"
averagePM25 <- leaflet() %>% 
  #fitBounds(-71.498028, 41.764783, -71.505702, 41.785249) %>%
  addTiles() %>%
  addGeoJSON(PM25_neigh, weight = 1) %>%
  setView(-71.41214420932586, 41.82550233662683, zoom = 13)
  averagePM25 # Print the map
  
#weight = 1, label = ~CensusTractBou_FeatureToPoin.Interpolated_Ave_PM_2_5
  
  ##addTiles() %>%  # Add default OpenStreetMap map tiles
  ## addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R") 
averagePM25 # Print the map
  


# update the output averagePM25, change the leaflet link in the index html
# then refresh the github, add new folder to githuba nd push

############ Developing the HTML Widgets #####################
install.packages("htmlwidgets")
library(htmlwidgets)
  
  
  
  
  
saveWidget(averagePM25, file="D:/DHall_Portfolio/averagePM25.html")

############ Developing HTML Widgets for Statistics ###############

install.packages("terra") #working with ggplot to bring in vector data and
                          #develop statistics sf, sp
                          
library(terra)



# Interactivity

### Want interactivity in: 
# Average Daily PM2.5 per Census Tract
 # Hover, highlights point on scatter plot
 # Clickable census tract will give average PM2.5 and corresponding table information

# Study Area Map 
 # Clickable census tract with population
 # Demographic information
 # Clickable AQ Sensors (name, date established and sensor host)



