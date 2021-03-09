# Sharing reproducible analyses and reports using RMarkdown & GitHub Pages

This content was presented at [SCCWRP](https://www.sccwrp.org/)'s March 2021 Tidy Tuesday meetup.

Explore our teaching materials [here](https://samanthacsik.github.io/RLadiesSB-sharing-analyses/)!

## Files
* `index.Rmd`: contains all notes, tutorial information, and example code used in our GitHup Page
* `index.html`: file used to produce our GitHub Page
* `code/palettes.R`: custom alien/UFO-themed color palette
* `linked_pages/*`: knitted documents linked in `index.html`

## Data
**`data/UFO_complete.csv`**: (data source: https://www.kaggle.com/NUFORC/ufo-sightings)
* `datetime`: date/time of UFO sighting
* `city`: city where UFO sighting occurred
* `state`: state where UFO sighting occurred 
* `country`: country where UFO sighting occurred
* `shape`: shape of UFO sighted
* `duration (seconds)`: number of seconds UFO sighting occurred for
* `duration (hours/min)`: number of hours and minutes UFO sighting occurred for
* `comments`: comments reported 
* `date posted`: date UFO report was posted
* `latitude`: latitude at which UFO sighting occurred
* `longitude`: longitude at which UFO sighting occurred

## Required packages:
To reproduce the content on our GitHub page (plots, tables, etc.), ensure that you have the following R packages installed:

```
## for cleaning and wrangling
install.packages("tidyverse")
install.packages("janitor")
install.packages("lubridate")

## for map making and general spatial work
install.packages("leaflet")
install.packages("mapview")
install.packages("sf")

## for making tables
install.packages("DT")
install.packages("gt")

## for palette making
install.packages("RColorBrewer")
install.packages("colorspace")
install.packages("scales")

# for reproducibility
install.packages("here")
```
