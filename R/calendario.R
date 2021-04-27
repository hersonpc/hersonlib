#' meses_curtos
#'
#' Relacao dos meses do ano de forma curta, em pt-Br.
#'
#' @format Vetor com os meses do ano:
#' \describe{
#'   \item{ mes }{ numeric }
#'   \item{ meses }{ character }
#'   \item{ abreviacao }{ character }
#'   \item{ abreviacao.us }{ character }
#'   \item{ semestre }{ character }
#'   \item{ trimestre }{ character }
#'   \item{ bimestre }{ character }
#' }
#' @source Proprio.
"calendario"

# calendario <- data.frame(
#     mes = 1:12,
#     meses = c("Janeiro","Fevereiro","Março","Abril","Maio","Junho","Julho","Agosto","Setembro","Outubro","Novembro","Dezembro"),
#     abreviacao = c("Jan","Fev","Mar","Abr","Mai","Jun","Jul","Ago","Set","Out","Nov","Dez"),
#     abreviacao.us = month.abb,
#     semestre = glue::glue("S.{c(rep(1,6), rep(2,6))}"),
#     semestre.label = c(rep("Jan-Jun",6), rep("Jul-Dez",6)),
#     trimestre = glue::glue("T.{c(rep(1,3), rep(2,3), rep(3,3), rep(4,3))}"),
#     trimestre.label = c(rep("Jan-Mar",3), rep("Abr-Jun",3), rep("Jul-Set",3), rep("Out-Dez",3)),
#     bimestre = glue::glue("B.{c(rep(1,2), rep(2,2), rep(3,2), rep(4,2), rep(5,2), rep(6,2))}"),
#     bimestre.label = c(rep("Jan-Fev",2), rep("Mar-Abr",2), rep("Mai-Jun",2), rep("Jul-Ago",2), rep("Set-Out",2), rep("Nov-Dez",2))
# )
# usethis::use_data(calendario)
