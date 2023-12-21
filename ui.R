
ui <- htmlTemplate(filename = "www/index.html",
                   
                   
                   generales = fluidPage(
                     column(width = 12,
                            tags$style(HTML(".radio-inline {margin-right: 25px; margin-left: 25px;}")),
                            align = "center"),
                     column(width = 12,
                            align=" center",
                            echarts4rOutput("barras_general", height = 290, width = 1100))),
                   selectores = fluidPage(
                     div(style="display: inline-block;vertical-align:top; width: 207px;",
                         airDatepickerInput(
                           view = "years",
                           minView = "years",
                           inputId = "fechas", label = "Rango de fechas a visualizar",
                           range = T, multiple = T,
                           value = c(min(datos$date),max(datos$date))
                         )),
                     div(style="display: inline-block;vertical-align:top; width: 20px;"),
                     div(style="display: inline-block;vertical-align:top; width: 195px;",
                         pickerInput(
                           "red_fechas","¿Quieres redondear fechas?",
                           choices = c(
                             "Mensual" = "months",
                             "Bimestral" = "bimonth",
                             "Cuatrimestre" = "quarter",
                             "Medio año" = "halfyear",
                             "Anual" = "year"
                           ),
                           selected = "months"
                         )
                         
                         ),
                     div(style="display: inline-block;vertical-align:top; width: 20px;"),
                     div(style="display: inline-block;vertical-align:top; width: 195px;",
                         pickerInput(
                           "dif_perc","Tipo de dif perc. a visualizar",
                           choices = c(
                             "Mensuales anualizados",
                             "Quincenales anualizados",
                             "Mensuales con respecto al último dato anterior",
                             "Quincenales con respecto al último dato anterior"
                           ),
                           selected = "months"
                         )),
                     br(),
                     actionButton("in_plot", "Generar gráfico", icon = icon("chart-line"))
                   ),
                   tabla_resumen_est = fluidPage(reactableOutput("tabla_resumen_final")),
                   notas = textOutput("notas_pie"),
                   siniestro_val = textOutput("siniestro_valor"),
                   liquid_chart = 
                     tags$div(
                       style = "margin-left: -20px", offset = 0,
                     echarts4rOutput("liquid", width = 300,height = 280
                                     )),
                   bar_lin = echarts4rOutput("bar_lin"),
                   graf_historico = echarts4rOutput("historico_texto_gr"),
                   boton_ing = prettyRadioButtons(
                     inputId = "boton_sub",
                     label = "Tipo de inflación:",
                     status = "success",
                     inline = TRUE,
                     choices = c("Subyacente", "No subyacente")
                   ),
                   mapa_mapboxer = globeOutput("mapa", 
                                                  width = 250, 
                                                  height = 250),
                   forecast = fluidPage(
                     chooseSliderSkin("Flat"),
                     setSliderColor("gray", 1),
                     fluidRow(
                       column(width = 4, align ="center",
                              pickerInput("inf_tipo", "Tipo de inflación a pronosticar", choices = c("Subyacente", "No subyacente")
                              )),
                       column(width = 4, align = "center", sliderInput("periodos", "Periodos a pronosticar", value = 12,
                                                                       min = 1, max = 40
                       )),
                       column(width = 4, align = "center", 
                              awesomeRadio("modelo", "Modelo a utilizar", choices = c("ARIMA", "BATS"), inline = T)
                       )
                     ),
                     br(),
                     fluidRow(
                       column(width = 12,
                              column(width = 12,
                                     echarts4rOutput("pronostico"))
                       )
                     )
                   )
                   
                )
                   

