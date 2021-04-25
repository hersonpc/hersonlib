#' Not in operator
#'
#' \%notin\% operator.
#'
#' @name %notin%
#' @rdname notinpipe
#' @keywords internal
#' @export
#' @param x Valor a ser validado na lista.
#' @param y Lista de valores a ser verificada.
#' @return Valor lógico caso o valor exista na lista `list(value)`.
`%notin%` <- function(x, y) !x %in% y
