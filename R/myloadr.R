#' Attach libraries
#'
#' @param ... ...
#' @param update ...
#'
#' @return ...
#' @export
#' @import rlang
#'
#' @examples
#' loadr(stats)

myloadr <- function(..., update = FALSE) {
  ap <- utils::available.packages()
  if(isFALSE("rlang" %in% ap[,1])) utils::install.packages("rlang")
  dots <- rlang::enquos(..., .named = TRUE)
  nms <- names(dots)
  i=1
  if(update){
    cat('\n \n Updating Libraries \n')
    utils::update.packages(ask=FALSE)
  }
  cat('\n \n Attach Libraries \n')
  for(i in seq_along(nms)){
    library(nms[[i]], character.only = TRUE)
  }
}
