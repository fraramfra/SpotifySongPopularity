options(shiny.port = 8050, shiny.autoreload = TRUE)

library(shiny)
library(bslib)
library(tidyverse)
library(ggplot2)
library(plotly)
library(here)

spotify <- read_csv(here("data/processed/processed.csv"))

spotify_genres <- as.vector(unique(spotify$track_genre))
spotify_qualities <- c("danceability", "energy", "loudness", "valence", "tempo", "duration", "popularity")

ui <- page_fluid(
  theme = bs_theme(bootswatch = "cyborg"),
  titlePanel("SpotifySpinStats - Analyzing Albums By Genre"),
  sidebarLayout(
    sidebarPanel(
      selectizeInput("multi_genre", "Start By Selecting One or Multiple Genres", choices = spotify$track_genre, multi = TRUE,
                     options = list(placeholder = "...", onInitialize =I('function() {this.setValue(""); }'))),
      selectInput("quality_1", "Select a Primary Characteristic", choices = spotify_qualities, selected = "popularity"),
      sliderInput(
        'popularity_range',
        'Album Popularity Value Range',
        min = spotify$popularity |> min(),
        max = spotify$popularity |> max(),
        value = c(spotify$popularity |> min(), spotify$popularity |> max())
      ),
      selectInput("quality_2", "Select a Secondary Characteristic", choices = spotify_qualities, selected = "popularity"),
      checkboxInput("explicit", "Remove Albums with Explicit Content"),
      p("What are all these characteristics?",
        tags$a(href = "https://developer.spotify.com/documentation/web-api/reference/get-audio-features", "Spotify for Developers")),
      br(),
      br(),
      p("Dashboard by F. Ramirez",
        tags$a(href = "https://github.com/fraramfra", "GitHub"))
    ),

    mainPanel(
      plotlyOutput("violin", width = "950px", height = "400px"),
      br(),
      plotlyOutput("scatter", width = "950px", height = "400px"),
    )
  ),
)


server <- function(input, output, session) {
  
  filtered_data <- reactive({
    req(input$multi_genre)
    spotify_filtered <- spotify |> 
      filter(track_genre %in% input$multi_genre, 
             between(popularity, input$popularity_range[1], input$popularity_range[2]))
    if (input$explicit) {
      spotify_filtered <- spotify_filtered |> 
        filter(explicit == FALSE)
    }
    return(spotify_filtered)
  })

  
  output$violin <- renderPlotly({
    return(
      ggplotly(
        ggplot(
          filtered_data(), 
          aes(
            x = track_genre, 
            y = !!sym(input$quality_1), 
            fill = track_genre,
            text = popularity
          )
        ) +
          geom_violin() +
          geom_point(stat = "summary", fun = median, color = "black", fill = "black") + 
          ggtitle("Music Quality by Genre") +
          labs(x = "Genre") +
          theme(
            panel.background = element_rect(fill = "black"),
            plot.background = element_rect(fill = "black"),
            legend.background = element_rect(fill = "black"),
            axis.text = element_text(color = "white", face = "bold", angle = 45),
            axis.title = element_text(color = "white", size = 14, face = "bold"),
            plot.title = element_text(color = "white", face = "bold"),
            legend.text = element_text(color = "white", face = "bold"),
          )
        )
    )
  })
  
  output$scatter <- renderPlotly({
    return(
      ggplotly(
        ggplot(
          filtered_data(), 
          aes(
            x = !!sym(input$quality_1), 
            y = !!sym(input$quality_2), 
            color = track_genre, 
            fill = track_genre,
            text = paste(
              "Artist: ", artists, "<br>",
              "Album: ", album_name, "<br>",
              "Popularity: ", popularity
            )
            
          )
        ) +
          geom_point(size = 0.7, alpha = 0.5) +
          geom_smooth(method = lm, se = FALSE, aes(group = track_genre)) +
          ggtitle("Quality Relationships") +
          theme(
            panel.background = element_rect(fill = "black"),
            plot.background = element_rect(fill = "black"),
            legend.background = element_rect(fill = "black"),
            axis.text = element_text(color = "white", face = "bold", angle = 45),
            axis.title = element_text(color = "white", size = 14, face = "bold"),
            plot.title = element_text(color = "white", face = "bold"),
            legend.text = element_text(color = "white", face = "bold"),
          ),
        tooltip = "text"
        )
    )
  })

}

shinyApp(ui, server)
