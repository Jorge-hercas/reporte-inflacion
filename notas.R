
base_estados |> 
  #filter( estado %in% input$ESTADO
       #   & Subservicio %in% input$subservicio_estado
  #) |> 
  group_by(Subservicio) |> 
  summarise(n = n()) |> 
  arrange(desc(n)) |> 
  top_n(5, n) |> 
  mutate(n2 = n) |> 
  e_charts(dispose = FALSE, Subservicio) |> 
  e_legend(show = FALSE,
           right = 1, 
           orient = "vertical",textStyle = 
             list(#fontFamily = "Roboto Condensed", 
               color = "gray",
               fontSize = 12)
  ) |>
  #e_pie(n, name = "Porcentaje de ingresos", radius = c("50%", "70%"),
      #  label = list(show = FALSE)) |> 
  e_effect_scatter(n,n2, symbol_size = 3, name = "Cantidad total") |> 
  e_y_axis(show = FALSE) |> 
  e_visual_map(n2, show = FALSE) |> 
  e_theme("auritus") |> 
  #e_labels(show = TRUE,
   #        textStyle = 
    #         list(fontFamily = "Roboto Condensed", 
                  
     #             fontSize = 8),
          # formatter = "{d}%",
      #     position = "inside") |> 
  e_title( "Top servicio más recurrente",
           left = "center",
           textStyle = list(
             color = "gray",
             fontFamily = "Roboto Condensed", fontSize = 14
           )
  ) |>
  e_tooltip(trigger = "axis",
            confine = TRUE,
            textStyle = list(fontFamily = "Roboto Condensed", fontSize = 12)) |> 
  e_color(color = RColorBrewer::brewer.pal(11, "Spectral")) 






base_estados |> 
  filter( estado %in% input$ESTADO
          & Subservicio %in% input$subservicio_estado
  ) |> 
  group_by(Subservicio) |> 
  summarise(n = n()) |> 
  arrange(desc(n)) |> 
  top_n(5, n) |> 
  e_charts(dispose = FALSE, Subservicio) |> 
  e_legend(show = FALSE,
           right = 1, 
           orient = "vertical",textStyle = 
             list(#fontFamily = "Roboto Condensed", 
               color = "gray",
               fontSize = 12)
  ) |>
  e_pie(n, name = "Porcentaje de ingresos", radius = c("50%", "70%"),
        label = list(show = FALSE)) |> 
  e_labels(show = TRUE,
           textStyle = 
             list(fontFamily = "Roboto Condensed", 
                  
                  fontSize = 8),
           formatter = "{d}%",
           position = "inside") |> 
  e_title( "Top servicio más recurrente",
           left = "center",
           textStyle = list(
             color = "gray",
             fontFamily = "Roboto Condensed", fontSize = 14
           )
  ) |>
  e_tooltip(trigger = "item",
            confine = TRUE,
            textStyle = list(fontFamily = "Roboto Condensed", fontSize = 12)) |> 
  e_color(color = RColorBrewer::brewer.pal(11, "Spectral")) 



library(RecordLinkage)
x <-
c("esto es una","esto es una","esto es una dqs")

levenshteinSim("esto es una cadena", x)


xd <- 
fread("datos/base_entidad_hist.csv") |> 
  mutate(
    estado = case_when(
      Entidad == "BAJA CALIFORNIA" ~ "Baja California",
      Entidad == "BAJA CALIFORNIA SUR" ~ "Baja California Sur",
      Entidad == "NAYARIT" ~ "Nayarit",
      Entidad == "JALISCO" ~ "Jalisco",
      Entidad == "AGUASCALIENTES" ~ "Aguascalientes",
      Entidad == "GUANAJUATO" ~ "Guanajuato",
      Entidad == "QUERETARO" ~ "Querétaro",
      Entidad == "HIDALGO" ~ "Hidalgo",
      Entidad == "MICHOACAN" ~ "Michoacán",
      Entidad == "MEXICO" ~ "México",
      Entidad == "CIUDAD DE MEXICO" ~ "Distrito Federal",
      Entidad == "COLIMA" ~ "Colima",
      Entidad == "MORELOS" ~ "Morelos",
      Entidad == "YUCATAN" ~ "Yucatán",
      Entidad == "CAMPECHE" ~ "Campeche",
      Entidad == "PUEBLA" ~ "Puebla",
      Entidad == "QUINTANA ROO" ~ "Quintana Roo",
      Entidad == "TLAXCALA" ~ "Tlaxcala",
      Entidad == "GUERRERO" ~ "Guerrero",
      Entidad == "OAXACA" ~ "Oaxaca",
      Entidad == "TABASCO" ~ "Tabasco",
      Entidad == "CHIAPAS" ~ "Chiapas",
      Entidad == "SONORA" ~ "Sonora",
      Entidad == "CHIHUAHUA" ~ "Chihuahua",
      Entidad == "COAHUILA" ~ "Coahuila",
      Entidad == "SINALOA" ~ "Sinaloa",
      Entidad == "DURANGO" ~ "Durango",
      Entidad == "ZACATECAS" ~ "Zacatecas",
      Entidad == "SAN LUIS POTOSI" ~ "San Luis Potosí",
      Entidad == "NUEVO LEON" ~ "Nuevo León",
      Entidad == "TAMAULIPAS" ~ "Tamaulipas",
      Entidad == "VERACRUZ" ~ "Veracruz",
      Entidad == "SIN DEFINIR" ~ "Sin definir"
    )
  ) |> 
  as.data.frame()

options(scipen = 999)
df$SINIESTRALIDAD


