
companycolors <img src="man/figures/logo.png" align="right" height=140/>
========================================================================

**`companycolors`** is an R helper package for using company-specific color palettes in charts.

### Usage

#### Pull list of company colors and HEX codes

``` r
measure_colors()
#> Lime Green       Navy     Hunter      Black       Gray      Taupe 
#>  "#93d500"  "#00205c"  "#00945e"  "#1c1f2a"  "#7b868c"  "#cfd2d3" 
#>        Web      White 
#>  "#eff0f1"  "#ffffff"
```

#### Find HEX code from specific color

``` r
measure_colors("Navy")
#>      Navy 
#> "#00205c"
```

#### Get shades between two colors

``` r
measure_palette("secondary", reverse = TRUE)(4)
#> [1] "#EFF0F1" "#C8CCCF" "#A1A9AD" "#7B868C"
```

#### Preview your color palettes

``` r
measure_palette_preview(palette = "mixed")
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

#### Plot!

``` r
ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Sepal.Length)) +
    geom_point(size = 4, alpha = 0.6) +
    scale_color_measure(discrete = FALSE, palette = "mixed", reverse = TRUE)
```

<img src="man/figures/README-unnamed-chunk-6-1.png" width="100%" />

``` r
ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
   geom_point(size = 4) +
   scale_color_measure(palette = "primary", reverse = FALSE)
```

<img src="man/figures/README-unnamed-chunk-7-1.png" width="100%" />

### Credits

Based on this great @drsimonj [blog post](https://drsimonj.svbtle.com/creating-corporate-colour-palettes-for-ggplot2)
