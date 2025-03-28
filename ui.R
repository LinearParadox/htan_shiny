ui <- fluidPage(
  titlePanel("Gene Expression by Treatment Group"),
  
  fluidRow(
    column(12,
      wellPanel(
        paste("Current Date and Time (UTC):", Sys. time()),
        br()
      )
    )
  ),
  
  sidebarLayout(
    sidebarPanel(
      # Text input for gene name
      textInput("gene_name", "Enter Gene Name:", 
                value = ""),
      
      # Choose grouping method
      radioButtons("group_method", "Group By:",
                  choices = c("Treated vs Untreated" = "binary",
                             "Exact Treatment" = "exact"),
                  selected = "binary"),
      
      # Download button for the plot
      downloadButton("download_plot", "Download Plot")
    ),
    
    mainPanel(
      # Display available genes for reference
      h4("Available Genes:"),
      verbatimTextOutput("available_genes"),
      # Show validation message if entered variable doesn't exist
      textOutput("validation_message"),
      plotOutput("boxplot", height = "500px"),
      verbatimTextOutput("summary_stats")
    )
  )
)