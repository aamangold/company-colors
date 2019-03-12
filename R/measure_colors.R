

#' Measure Colors
#'
#' @description Pulls list of Measure's corporate colors or identifies HEX code of specific color
#'
#' @export
#'
#' @examples
#' measure_colors() Pull list of all colors and HEX codes
#' measure_colors("Navy") Get specific HEX code

measure_colors <- function(...) {
    cols <- c(...)
    
    measure_colors <- c(`Lime Green` =	"#93d500",
                        `Navy` = "#00205c",
                        `Hunter` = "#00945e",
                        `Black`=	"#1c1f2a",
                        `Gray`=	"#7b868c",
                        `Taupe`= "#cfd2d3",
                        `Web`= "#eff0f1",
                        `White`= "#ffffff")
    
    if(is.null(cols))
        return(measure_colors)
    
    measure_colors[cols]
}







#' Measure Color Palettes
#'
#' @description Generates HEX codes of shades between 2 color palette
#'
#' @param palette Options: main, primary, secondary, tertiary, accent, green, gray, dark, mixed
#' @param reverse 
#' @param ... 
#'
#' @export
#'
#' @examples
#' measure_palette("main")(10)
#' measure_palette("secondary", reverse = TRUE)(10)



measure_palette <- function(palette = "main", reverse = FALSE, ...) {
    
    measure_palettes <- list(
        `primary` = measure_colors("Lime Green", "Hunter", "Black"),
        `main` = measure_colors("Black","White"),
        `secondary` = measure_colors("Gray", "Web"),
        `tertiary` = measure_colors("Lime Green", "Navy"),
        `accent` = measure_colors("Hunter", "Taupe"),
        `green` = measure_colors("Lime Green", "Hunter"),
        `gray` = measure_colors("Gray", "Taupe"),
        `dark` = measure_colors("Black", "Navy"),
        `mixed` = measure_colors("Taupe", "Gray", "Lime Green", "Hunter", "Navy", "Black")
    )
    
    pal <- measure_palettes[[palette]]
    
    if (reverse) pal <- rev(pal)
    
    grDevices::colorRampPalette(pal, ...)
    
    
}



#' Scale Measure Color
#'
#' @param palette Options: main, primary, secondary, tertiary, accent, green, gray, dark, mixed
#' @param discrete 
#' @param reverse 
#' @param ... 
#'
#' @export
#'
#' @examples
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'   geom_point(size = 4) +
#'   scale_color_measure(palette = "tertiary", reverse = TRUE)
 



scale_color_measure <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
    pal <- measure_palette(palette = palette, reverse = reverse)
    
    if (discrete) {
        discrete_scale("colour", paste0("measure_", palette), palette = pal, ...)
    } else {
        scale_color_gradientn(colours = pal(256), ...)
    }
}


#' Scale Measure Fill
#'
#' @param palette Options: main, primary, secondary, tertiary, accent, green, gray, dark, mixed
#' @param discrete 
#' @param reverse 
#' @param ... 
#'
#' @export
#'
#' @examples
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Sepal.Length)) +
#'    geom_point(size = 4, alpha = 0.6) +
#'    scale_color_measure(discrete = FALSE, palette = "accent", reverse = TRUE)




scale_fill_measure <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
    pal <- measure_palette(palette = palette, reverse = reverse)
    
    if (discrete) {
        discrete_scale("fill", paste0("measure_", palette), palette = pal, ...)
    } else {
        scale_fill_gradientn(colors = pal(256), ...)
    }
}



#' Measure Palette Preview
#'
#' @param palette Options: main, primary, secondary, tertiary, accent, green, gray, dark, mixed
#' @param n Number of shades to be generated
#'
#' @export
#'
#' @examples
#' measure_palette_preview()
#' measure_palette_preview(palette = "accent", n = 15)


measure_palette_preview <- function(palette = "mixed", n = 25) {
    
    a <- measure_palette(palette)(n)
    b <- tibble::tibble(hex = a)
    
    ggplot2::ggplot(b, aes(1, fill = hex)) +
        ggplot2::geom_histogram(binwidth = length(a), show.legend = FALSE) +
        ggplot2::coord_flip() +
        scale_fill_measure(palette = palette) +
        theme_minimal() +
        ggtitle(paste0(palette, " Color Palette")) +
        theme(axis.text = element_blank(),
              axis.title = element_blank(),
              panel.grid = element_blank(), 
              plot.title = element_text(hjust =0.06))
        
    
}








