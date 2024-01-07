
### FOR USING R in the TERMINAL ------------------------------------------------

# included in .conflig/radian/profile
# options(radian.complete_while_typing = TRUE)

# disable diagnostics for R language server (v annoying in vim)
options(languageserver.diagnostics = FALSE)

# alternative: change only specific lintr defaults
# https://cran.r-project.org/web/packages/lintr/vignettes/lintr.html
# see ~/.lintr file

# Disable completion from the language server
options(languageserver.server_capabilities =
        list(completionProvider    = FALSE,
             completionItemResolve = FALSE))

# set the position and size of the plot window
grDevices::X11.options(xpos = 900, ypos = 100, width = 10, height = 9)


### USEFUL FUNCTIONS ----------------------------------------------------------

.tarko <- new.env()

# open data frame in the vd program (visidata) in a new terminal window
# needs prior install
.tarko$view_df = function (x, terminal = "kitty") {

      filePath <- tempfile(
        pattern = "visidatatemp",      
        fileext = ".csv"
      )
      
      if(!is.data.frame(x)) { x <- as.data.frame(x) }
      
      # only keep meaningful rownames
      if (!is.null(rownames(x)) & rownames(x)[1] != "1") {
        x <- data.frame(row_names = rownames(x), x)
      }
      
      rio::export(x, file = filePath)
      system(paste(terminal, "vd", filePath, "&"))
     
    }


# show powers of 10 using: scales_*_continuous(labels = scientific_10)
.tarko$scientific_10 = function(x) {
      y <- ifelse(x != 0, 
                  parse(text=gsub("e", " %*% 10^", scales::scientific_format()(x))),
                  parse(text = "0")
      )
      return(y)
    }

# calculate the mode of a vector
.tarko$Mode = function(x, digits = 2){
      values <- unique(na.omit(x))
      result <- values[match(x, values) |> tabulate() |> which.max()]
      
      if (is.numeric(result)) {result <- round(result, digits = digits)}
      
      return(result)
    }

# function used by data_summary
.tarko$.num_x <- function(x){
      
      if(is.numeric(x)) {
        y <- na.omit(x)
        if(length(y) == 0) { y <- NA }
      } else {
        y <- NA
      }  
      return(y)
      
    }

.tarko$data_summary <- function(df, out = "visidata", digits = 2){
      
      summary_df <- tibble::tibble(
          Variable    = iconv(names(df)),
          Description = purrr::map_chr(df, ~ifelse(!is.null(attr(.x, "label")), iconv(attr(.x, "label")), "")),
          Obs.        = purrr::map_dbl(df, ~sum(!is.na(.x))),
          Missing     = purrr::map_dbl(df, ~sum( is.na(.x))),
          Type        = purrr::map_chr(df, ~dplyr::first(class(.x))),
          Mean        = purrr::map_dbl(df, ~mean    (.num_x(.x))),
          Median      = purrr::map_dbl(df, ~median  (.num_x(.x))),
          Mode        = purrr::map_chr(df, ~as.character(Mode(.x, digits))),
          Std.Dev.    = purrr::map_dbl(df, ~sd      (.num_x(.x))),
          Min         = purrr::map_dbl(df, ~min     (.num_x(.x))),
          Max         = purrr::map_dbl(df, ~max     (.num_x(.x))),
          Skewness    = purrr::map_dbl(df, ~moments::skewness(.num_x(.x))),
          Kurtosis    = purrr::map_dbl(df, ~moments::kurtosis(.num_x(.x)))
        ) |>
          dplyr::mutate_if(is.numeric, ~round(.x, digits))
        
      # useful for use in RStudio
      if (out %in% c("RStudio", "rstudio", "Rstudio")){
        summary_df |>
            reactable::reactable(
              searchable = TRUE,
              showSortable = TRUE,
              showSortIcon = TRUE,
              rownames = FALSE,
              pagination = TRUE,
              resizable = TRUE,
              showPageSizeOptions = TRUE,
              compact = TRUE
            )
      } else if (out == "visidata") { 
         # useful in the terminal
         view_df(summary_df)
      } else {
        # useful for generating tables of summary statistics for papers
        return(summary_df)
      }
     
    }

attach(.tarko)


### ggplot theme -----------------------------------------------------------------

ggplot2::theme_set(ggplot2::theme_light())

ggplot2::theme_replace(
  text          = ggplot2::element_text(family = "Times"),
  
  # enable markdown in the texts
  axis.title.x  = ggtext::element_markdown(padding = ggplot2::unit(c(5, 0, 0, 0), "pt"), size = 16),
  axis.title.y  = ggtext::element_markdown(angle = 90, 
                                   padding = ggplot2::unit(c(0, 0, 5, 0), "pt"),
                                   size = 16),
  axis.text     = ggplot2::element_text(size = 16),
  plot.title    = ggtext::element_markdown(),
  plot.subtitle = ggtext::element_markdown(),
  
  # align the caption to the left
  plot.caption.position = "plot",
  plot.caption  = ggtext::element_markdown(hjust = 0, 
                                   padding = ggplot2::unit(c(10, 0, 0, 0), "pt"),
                                   size = 14),
  
  # for facetting
  strip.text    = ggplot2::element_text(color = "black")
)


