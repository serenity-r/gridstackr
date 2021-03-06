#' Setup for a gridstackjs
#' @importFrom shiny addResourcePath singleton HTML tags
#' @export
initGS <- function() {

  addResourcePath("gridstackjs", system.file("gridstackjs", package = "gridstackr", mustWork = TRUE))
  addResourcePath("lodash", system.file("lodash", package = "gridstackr", mustWork = TRUE))
  addResourcePath("jquery-ui", system.file("jquery-ui", package = "gridstackr", mustWork = TRUE))

  css <- "
.grid-stack {
  background: lightgoldenrodyellow;
}

.grid-stack-item-content {
  color: #2c3e50;
  text-align: center;
  background-color: #18bc9c;
}"

  initconf <- "
$(function () {
  var options = {
    float: true,
    cellHeight: 80,
    verticalMargin: 10
  };
  $('.grid-stack').gridstack(options);
});";

  singleton(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = file.path("gridstackjs", "gridstack.css")),

      tags$script(src = file.path("jquery-ui", "jquery-ui.js")),
      tags$script(src = file.path("lodash", "lodash.min.js")),

      tags$script(src = file.path("gridstackjs", "gridstack.min.js")),
      tags$script(src = file.path("gridstackjs", "gridstack.jQueryUI.js")),

      tags$style(HTML(css)),
      tags$script(HTML(initconf))

    )
  )
}

#' Gridstack container
#' @param ... \code{gs_item} elements to include in the grid.
#' @export
gridstack <- function(..., height = "500") {

  tags$div(class = "grid-stack", height = height, ...)

}

#' Gridstack Item
#' @param ... Elements to include within the grid item.
#' @param x x position to put the grid item.
#' @param y y position to put the grid item.
#' @param w weight of the grid item.
#' @param h height of the grid item.
#' @export
gs_item <- function(..., x = 0, y = 0, w = 4, h = 4) {

  tags$div(
    class = "grid-stack-item",
    "data-gs-x" = x, "data-gs-y" = y,
    "data-gs-width" = w, "data-gs-height" = h,
    tags$div(class = "grid-stack-item-content", ...)
  )

}
