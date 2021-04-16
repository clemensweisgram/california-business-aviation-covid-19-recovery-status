  library(shiny)
  library(tidyverse)
  library(leaflet)
  library(shinyalert)
  
  ui <- bootstrapPage(
    theme = shinythemes::shinytheme('simplex'),
    leaflet::leafletOutput('map', width = '100%', height = '100%'),
    absolutePanel(top = 10, right = 10, id = 'controls',
                  h5(strong("California Business Aviation COVID-19 Recovery Status")),
                  checkboxGroupInput(
                    inputId = "physical_class_selection",
                    label = strong("Physical Class"),
                    choices = c("Jet", "Turbine"),
                    selected = "Jet"),
                  checkboxGroupInput(
                    inputId = "flight_type_selection",
                    label = strong("Flight Type"),
                    choices = c("Domestic", "Foreign to US", "US to Foreign"),
                    selected = c("Domestic", "Foreign to US", "US to Foreign")),
                  selectInput(inputId = "aircraft_type_selection",
                              label = strong("Select aircraft types"),
                              choices = c("_ALL_", "C208 - Cessna 208 Caravan", "SR22 - Cirrus SR 22", "PC12 - Pilatus PC-12", "C750 - Cessna Citation X", "CL35 - Bombardier Challenger 300", "C25B - Cessna Citation CJ3", "E55P - Embraer Phenom 300"
                                          , "B350 - Beech Super King Air 350", "EC35 - Eurocopter EC-135", "C560 - Cessna Citation V/Ultra/Encore", "C680 - Cessna Citation Sovereign", "C68A - Cessna Citation Latitude", "F900 - Dassault Falcon 900"
                                          , "FA7X - Dassault Falcon F7X", "TBM8 - Socata TBM-850", "C421 - Cessna Golden Eagle 421", "PA46 - Piper Malibu", "BE20 - Beech 200 Super King", "C56X - Cessna Excel/XLS", "CL60 - Bombardier Challenger 600/601/604"
                                          , "E545 - Embraer EMB-545 Legacy 450", "C525 - Cessna CitationJet/CJ1", "H25B - BAe HS 125/700-800/Hawker 800", "C550 - Cessna Citation II/Bravo", "BE40 - Raytheon/Beech Beechjet 400/T-1", "F2TH - Dassault Falcon 2000"
                                          , "FA50 - Dassault Falcon/Myst貥 50", "G150 - Gulfstream G150", "G280 - Gulfstream G280", "GALX - IAI 1126 Galaxy/Gulfstream G200", "GLEX - Bombardier BD-700 Global Express", "GLF4 - Gulfstream IV/G400"
                                          , "GLF5 - Gulfstream V/G500", "GLF6 - Gulfstream", "TBM9 - Socata TBM", "E550 - Embraer Legacy 500", "LJ45 - Bombardier Learjet 45", "C210 - Cessna 210 Centurion", "C340 - Cessna 340", "DA62 - Diamond DA62"
                                          , "S22T - Cirrus SR-22 Turbo", "C441 - Cessna Conquest", "CL30 - Bombardier (Canadair) Challenger 300", "C25A - Cessna Citation CJ2", "E50P - Embraer Phenom 100", "COL3 - Lancair LC-40 Columbia 400", "P46T - Piper Malibu Meridian"
                                          , "C402 - Cessna 401/402", "TBM7 - Socata TBM-7", "AC90 - Gulfstream Commander", "C25C - Cessna Citation CJ4", "C310 - Cessna 310", "GL5T - Bombardier BD-700 Global 5000", "C510 - Cessna Citation Mustang"
                                          , "C55B - Cessna Citation Bravo", "SR20 - Cirrus SR-20", "BE10 - Beech King Air 100 A/B", "HDJT - HONDA HA-420 HondaJet", "M20T - Turbo Mooney M20K", "LJ60 - Bombardier Learjet 60", "B36T - Allison 36 Turbine Bonanza"
                                          , "DA42 - Diamond Twin Star", "PA34 - Piper PA-34 Seneca", "LJ31 - Bombardier Learjet 31/A/B", "SF50 - Cirrus Vision SF50", "EPIC - Dynasty", "C650 - Cessna III/VI/VII", "C425 - Cessna 425 Corsair", "BE58 - Beech 58"
                                          , "LJ75 - Learjet 75", "PRM1 - Raytheon Premier 1/390 Premier 1", "J328 - Fairchild Dornier 328 Jet", "ASTR - IAI Astra 1125", "LJ35 - Bombardier Learjet 35/36", "C501 - Cessna I/SP", "HA4T - Hawker 4000"
                                          , "LJ40 - Learjet 40; Gates Learjet", "GLF3 - Gulfstream III/G300", "C25M - Cessna Citation M2", "PAY1 - Piper Cheyenne 1", "LJ55 - Bombardier Learjet 55", "C206 - Cessna 206 Stationair", "FA20 - Dassault Falcon/Myst貥 20"
                                          , "EA50 - Eclipse 500", "AEST - Piper Aero Star", "GA5C - G-7 Gulfstream G500", "FA8X - Dassault Falcon 8X", "BE55 - Beech Baron 55", "BE30 - Raytheon 300 Super King Air", "BE9T - Beech F90 King Air", "C414 - Cessna Chancellor 414"
                                          , "H25C - BAe/Raytheon HS 125-1000/Hawker 1000", "BE90 - Beech King Air 90", "GLF2 - Gulfstream II/G200", "B429 - Bell 429", "DHC6 - DeHavilland Twin Otter", "C500 - Cessna 500/Citation I", "LJ70 - Learjet 70"
                                          , "COL4 - Lancair LC-41 Columbia 400", "P180 - Piaggio P-180 Avanti", "C337 - Cessna Turbo Super Skymaster", "PAY3 - Piper PA-42-720 Cheyenne 3", "C10T - Cessna P210 (Turbo)", "FA10 - Dassault Falcon/Myst貥 10"
                                          , "A139 - Agusta AB-139", "C551 - Cessna Citation II/SP", "WW24 - IAI 1124 Westwind", "PAY4 - Piper Cheyenne 400", "AC95 - Gulfstream Jetprop Commander 1000", "PAY2 - Piper Cheyenne 2", "MU2 - Mitsubishi Marquise/Solitaire"
                                          , "BE50 - Beech Twin Bonanza", "AC80 - Aero Commander Turbo 680", "MU30 - Mitsubishi MU300/ Diamond I", "PA31 - Piper Navajo PA-31", "S76 - Sikorsky S-76", "EC45 - Eurocopter EC-145", "KODI - Quest Kodiak", "BE60 - Beech 60 Duke"
                                          , "C240 - Cessna TTx Model T240", "C526 - Cessna 526 CitationJet", "B430 - Bell 430", "P337 - Cessna T337G Pressurized Skymaster", "C205 - Cessna 205", "C207 - Cessna Turbo Stationair 7", "LJ25 - Bombardier Learjet 25"
                                          , "C320 - Cessna Skyknight", "AC6L - Aero Commander 680FL", "SBR1 - North American Rockwell Sabre 40/60", "B06 - Agusta AB-206 LongRanger"),
                              selected = c("_ALL_"),
                              multiple = TRUE,
                              selectize = TRUE),
                  # CODE BELOW: Add an action button named show_about
                  actionButton('show_user_guide', 'User Guide', class = "btn btn-light")
    ),
    tags$style(type = "text/css", "
      html, body {width:100%;height:100%}     
      #controls{background-color:white;padding:20px;}
    "),
    useShinyalert()
  )
  server <- function(input, output, session) {
  
    user_guide_text = "<b>Dashboard shows flight volume (arrivals & departures) per airport</b><br><br>
                      Circle size indicates absolute flight volume (the greater the number of pre-pandemic movements at the airport, the larger the circle)(scaled for visibility reasons)<br><br>
                      Circle color indicates % change to previous year<br><br>
                      <b>Excluding helicopter and piston </b><br>                           
                      <b>Excluding airports with less than 60 movements per month</b><br><br>                            
                      <br>Source: FAA Traffic Flow Management System Counts (TFMSC) <br><br>
                      Contact: cweisgram2019@student.hult.edu <br><br>                           
                      © Clemens Weisgram 2021"
    
    # for mere info about shinyalert refer to https://deanattali.com/blog/shinyalert-package/
    observeEvent(input$show_user_guide, shinyalert(
      title = "",
      text = user_guide_text,
      size = "m", 
      closeOnEsc = TRUE,
      closeOnClickOutside = TRUE,
      html = TRUE,
      type = "",
      showConfirmButton = FALSE,
      showCancelButton = TRUE,
      cancelButtonText = "Dismiss",
      timer = 0,
      imageUrl = "",
      animation = FALSE
    ))
    
    showModal(shinyalert(
      title = "",
      text = user_guide_text,
      size = "m", 
      closeOnEsc = TRUE,
      closeOnClickOutside = TRUE,
      html = TRUE,
      type = "",
      showConfirmButton = FALSE,
      showCancelButton = TRUE,
      cancelButtonText = "Dismiss",
      timer = 0,
      imageUrl = "",
      animation = FALSE
    ))
    
    observe({
    #################
    library(tidyverse)
    library(readxl)
    library(qdapTools)
    library(lubridate)
    library(RColorBrewer)
    
    # setting working directory (only if run locally)
    #setwd("/Users/clemensweisgram/Documents/Coding Projects/California Business Aviation Project/FINAL APP_UPDATE_FEB2021")
    
    # importing data
    airport_coordinates <- read_excel("./airport_coordinates/airport_coordinates.xlsx")
    #data1 <- read_excel("/Users/clemensweisgram/Desktop/Bay Area Business Aviation Project/data2.xls")
    data2020 <- read_excel("./data_Feb2020.xlsx", col_types = c("text", "text", "text", "text", "text", "text", "text", "text", "text", "text", "text", "text", "text", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
    data2021 <- read_excel("./data_Feb2021.xlsx", col_types = c("text", "text", "text", "text", "text", "text", "text", "text", "text", "text", "text", "text", "text", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
    
    # adjusting column names
    colnames(data2020) <- c("date", "airport", "flight_type", "user_class", "weight_class", "physical_class", "aircraft_type", "business_jet", "regional_jet", "business_aviation", "airplane_approach_category", "airplane_design_group", "taxiway_design_group", "departures", "arrivals", "total_operations", "departure_seats", "average_departure_seats", "arrival_seats", "average_arrival_seats")
    colnames(data2021) <- c("date", "airport", "flight_type", "user_class", "weight_class", "physical_class", "aircraft_type", "business_jet", "regional_jet", "business_aviation", "airplane_approach_category", "airplane_design_group", "taxiway_design_group", "departures", "arrivals", "total_operations", "departure_seats", "average_departure_seats", "arrival_seats", "average_arrival_seats")
    #colnames(data1) <- c("date", "airport", "flight_type", "user_class", "weight_class", "physical_class", "aircraft_type", "business_jet", "regional_jet", "business_aviation", "airplane_approach_category", "airplane_design_group", "taxiway_design_group", "departures", "arrivals", "total_operations", "departure_seats", "average_departure_seats", "arrival_seats", "average_arrival_seats")
    
    # adjusting date format (Excel import needs to be in text format "01/14/2020" refer to https://trumpexcel.com/convert-date-to-text-excel/)
    #data2020$date <- as.Date(data2020$date, tryFormats = c("%m/%d/%Y", "%d/%m/%Y"))
    #data2021$date <- as.Date(data2021$date, tryFormats = c("%m/%d/%Y", "%d/%m/%Y"))
    #is.Date(data2020$date)
    
    data2020 <- data2020 %>%
      separate(col = "airport", into = c("airport_code", "airport_name"), sep = " - ", remove = FALSE)
    data2021 <- data2021 %>%
      separate(col = "airport", into = c("airport_code", "airport_name"), sep = " - ", remove = FALSE)
    
    if ("_ALL_" %in% input$aircraft_type_selection) {
      input_from_selection <- c("C208 - Cessna 208 Caravan", "SR22 - Cirrus SR 22", "PC12 - Pilatus PC-12", "C750 - Cessna Citation X", "CL35 - Bombardier Challenger 300", "C25B - Cessna Citation CJ3", "E55P - Embraer Phenom 300"
                                , "B350 - Beech Super King Air 350", "EC35 - Eurocopter EC-135", "C560 - Cessna Citation V/Ultra/Encore", "C680 - Cessna Citation Sovereign", "C68A - Cessna Citation Latitude", "F900 - Dassault Falcon 900"
                                , "FA7X - Dassault Falcon F7X", "TBM8 - Socata TBM-850", "C421 - Cessna Golden Eagle 421", "PA46 - Piper Malibu", "BE20 - Beech 200 Super King", "C56X - Cessna Excel/XLS", "CL60 - Bombardier Challenger 600/601/604"
                                , "E545 - Embraer EMB-545 Legacy 450", "C525 - Cessna CitationJet/CJ1", "H25B - BAe HS 125/700-800/Hawker 800", "C550 - Cessna Citation II/Bravo", "BE40 - Raytheon/Beech Beechjet 400/T-1", "F2TH - Dassault Falcon 2000"
                                , "FA50 - Dassault Falcon/Myst貥 50", "G150 - Gulfstream G150", "G280 - Gulfstream G280", "GALX - IAI 1126 Galaxy/Gulfstream G200", "GLEX - Bombardier BD-700 Global Express", "GLF4 - Gulfstream IV/G400"
                                , "GLF5 - Gulfstream V/G500", "GLF6 - Gulfstream", "TBM9 - Socata TBM", "E550 - Embraer Legacy 500", "LJ45 - Bombardier Learjet 45", "C210 - Cessna 210 Centurion", "C340 - Cessna 340", "DA62 - Diamond DA62"
                                , "S22T - Cirrus SR-22 Turbo", "C441 - Cessna Conquest", "CL30 - Bombardier (Canadair) Challenger 300", "C25A - Cessna Citation CJ2", "E50P - Embraer Phenom 100", "COL3 - Lancair LC-40 Columbia 400", "P46T - Piper Malibu Meridian"
                                , "C402 - Cessna 401/402", "TBM7 - Socata TBM-7", "AC90 - Gulfstream Commander", "C25C - Cessna Citation CJ4", "C310 - Cessna 310", "GL5T - Bombardier BD-700 Global 5000", "C510 - Cessna Citation Mustang"
                                , "C55B - Cessna Citation Bravo", "SR20 - Cirrus SR-20", "BE10 - Beech King Air 100 A/B", "HDJT - HONDA HA-420 HondaJet", "M20T - Turbo Mooney M20K", "LJ60 - Bombardier Learjet 60", "B36T - Allison 36 Turbine Bonanza"
                                , "DA42 - Diamond Twin Star", "PA34 - Piper PA-34 Seneca", "LJ31 - Bombardier Learjet 31/A/B", "SF50 - Cirrus Vision SF50", "EPIC - Dynasty", "C650 - Cessna III/VI/VII", "C425 - Cessna 425 Corsair", "BE58 - Beech 58"
                                , "LJ75 - Learjet 75", "PRM1 - Raytheon Premier 1/390 Premier 1", "J328 - Fairchild Dornier 328 Jet", "ASTR - IAI Astra 1125", "LJ35 - Bombardier Learjet 35/36", "C501 - Cessna I/SP", "HA4T - Hawker 4000"
                                , "LJ40 - Learjet 40; Gates Learjet", "GLF3 - Gulfstream III/G300", "C25M - Cessna Citation M2", "PAY1 - Piper Cheyenne 1", "LJ55 - Bombardier Learjet 55", "C206 - Cessna 206 Stationair", "FA20 - Dassault Falcon/Myst貥 20"
                                , "EA50 - Eclipse 500", "AEST - Piper Aero Star", "GA5C - G-7 Gulfstream G500", "FA8X - Dassault Falcon 8X", "BE55 - Beech Baron 55", "BE30 - Raytheon 300 Super King Air", "BE9T - Beech F90 King Air", "C414 - Cessna Chancellor 414"
                                , "H25C - BAe/Raytheon HS 125-1000/Hawker 1000", "BE90 - Beech King Air 90", "GLF2 - Gulfstream II/G200", "B429 - Bell 429", "DHC6 - DeHavilland Twin Otter", "C500 - Cessna 500/Citation I", "LJ70 - Learjet 70"
                                , "COL4 - Lancair LC-41 Columbia 400", "P180 - Piaggio P-180 Avanti", "C337 - Cessna Turbo Super Skymaster", "PAY3 - Piper PA-42-720 Cheyenne 3", "C10T - Cessna P210 (Turbo)", "FA10 - Dassault Falcon/Myst貥 10"
                                , "A139 - Agusta AB-139", "C551 - Cessna Citation II/SP", "WW24 - IAI 1124 Westwind", "PAY4 - Piper Cheyenne 400", "AC95 - Gulfstream Jetprop Commander 1000", "PAY2 - Piper Cheyenne 2", "MU2 - Mitsubishi Marquise/Solitaire"
                                , "BE50 - Beech Twin Bonanza", "AC80 - Aero Commander Turbo 680", "MU30 - Mitsubishi MU300/ Diamond I", "PA31 - Piper Navajo PA-31", "S76 - Sikorsky S-76", "EC45 - Eurocopter EC-145", "KODI - Quest Kodiak", "BE60 - Beech 60 Duke"
                                , "C240 - Cessna TTx Model T240", "C526 - Cessna 526 CitationJet", "B430 - Bell 430", "P337 - Cessna T337G Pressurized Skymaster", "C205 - Cessna 205", "C207 - Cessna Turbo Stationair 7", "LJ25 - Bombardier Learjet 25"
                                , "C320 - Cessna Skyknight", "AC6L - Aero Commander 680FL", "SBR1 - North American Rockwell Sabre 40/60", "B06 - Agusta AB-206 LongRanger")
    } else {
      input_from_selection <- input$aircraft_type_selection
    }
    
    analysis2020 <- data2020 %>%
      filter(aircraft_type %in% input_from_selection) %>%
      filter(physical_class %in% input$physical_class_selection) %>% # automatically filtering out helicopters and pistons
      filter(flight_type %in% input$flight_type_selection) %>%
      group_by(airport, airport_code, airport_name) %>%
      summarise(total_ops_2020 = sum(total_operations)) %>%
      arrange(desc(total_ops_2020)) #%>%
    #filter(year(date) == 2020) %>%
    #filter(month(date) == 1)
    
    analysis2021 <- data2021 %>%
      filter(aircraft_type %in% input_from_selection) %>%
      filter(physical_class %in% input$physical_class_selection) %>% # automatically filtering out helicopters and pistons
      filter(flight_type %in% input$flight_type_selection) %>%
      group_by(airport, airport_code, airport_name) %>%
      summarise(total_ops_2021 = sum(total_operations)) %>%
      arrange(desc(total_ops_2021)) 
    
    analysis <- analysis2020 %>%
      full_join(analysis2021, by = c("airport", "airport_code", "airport_name")) %>%
      select(airport, airport_code, airport_name, total_ops_2020, total_ops_2021) 
    
    analysis <- analysis %>%
      mutate(abs_dif = total_ops_2021 - total_ops_2020) %>%
      mutate(rel_dif = (total_ops_2021 - total_ops_2020)/total_ops_2020) %>%
      drop_na() %>%
      filter(total_ops_2020 >= 60) # only keep airports with more than 2 movements per day
    
    # re-scaling of data up to have only positive values for abs_dif and rel_dif
    #analysis$abs_dif_pos <- (analysis$abs_dif + abs(min(analysis$abs_dif[is.finite(analysis$abs_dif)])))**3 # cubed for better visualization results
    #analysis$rel_dif_pos <- analysis$rel_dif + 2
    analysis$total_ops_2020_rescaled <- analysis$total_ops_2020 ** (1/2.75)
    
    analysis <- merge(analysis, airport_coordinates, by = "airport_code")
    
    #################
    
    # square or even cube abs_dif_pos to make impact more visible
    (domain <- range(analysis$rel_dif))
    pal <- colorNumeric(palette = colorRampPalette(brewer.pal(9,"RdYlGn"))(100), domain = domain)
    
    
    output$map <- leaflet::renderLeaflet({
      analysis %>%
        leaflet() %>% 
        setView( -119.41, 36.77, zoom = 7) %>% 
        addTiles() %>% 
        addProviderTiles(providers$CartoDB.Positron) %>% # uses more neutral base map
        addCircleMarkers(
          popup = ~ paste("<strong>", airport, "</strong>","<br>", 
                          "Change Feb 2020-Feb 2021: ", round(rel_dif*100, 1), "%", "<br>", 
                          "Total Movements Feb 2021: ", total_ops_2021, sep = ""), 
                          radius = ~ total_ops_2020_rescaled,
                          fillColor = ~ pal(rel_dif), 
                          color = ~ pal(rel_dif), 
                          weight = 1
        )
    })
    }) #closing observe
  }
  
  shinyApp(ui, server)