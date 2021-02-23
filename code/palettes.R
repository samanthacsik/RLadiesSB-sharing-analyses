## Color palettes 

## Galaxy Quest
## Never give up. Never surrender.
library(RColorBrewer)
library(colorspace)
library(scales)

alien_palettes <- list(
  
  ## 9 colors
  ## There is no future without it.
  fifth_element = c("#A1121C", "#F0000D",  "#FA3D14", "#FDCE90", "#E0918F", "#AFD7EE", "#42ACDC", "#0172B9", "#01466B"), 
  
  ## 8 colors
  ## Never give up. Never surrender.
  galaxy_quest  =  c("#150A82","#2F0BA8",  "#6654FE",  "#03A4D8","#F080F0",  "#BD32EF", "#A51B42", "#220111"),
  
  ## 6 colors
  ## Nice planet. We'll take it.
  mars_attacks = c("#FF261C", "#DF592A", "#E6C860", "#FFF7BF", "#3E2145", "#44795C"),
  
  ## 6 colors
  ## In space no one can hear you scream.
  alien = c("#E8E2A9", "#DDD73B", "#48A43E", "#024205", "#838683", "#010300"),
  
  ## 5 colors
  ## He is afraid. He is alone. He is three million light years from home.
  et = c("#BD1F1D", "#F28B3D", "#6CACDA", "#094B85", "#0C1944"),
  
  ## 4 colors
  ## She's one galactic girl who saves the day in a stellar way!
  zenon = c("#EBEB92", "#E13B7A", "#38368B", "#0085B8")
  

)

# name a cal_palette function, where there are 3 argument names: name, n, and type
alien_palette <- function(name, n, type = c("discrete", "continuous")) {
  
  ## name = "et"
  
  
  # designate type as matching either argument in c("discrete", "continuous")
  type <- match.arg(type)
  
  # pal is palette function subsetting by name
  pal <- alien_palettes[[name]]
  # if input doesn't equal any names in pal, give error message
  if (is.null(pal))
    stop("Palette not found.")
  
  
  if (missing(n)) {
    n <- length(pal)
  }
  
  # if the type is discrete and n is greater than the length of the palette, give error message
  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }
  
  
  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb

# print.palette is a function that will list all palettes in the package
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))
  
  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")
  
  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}








