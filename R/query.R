#' Executa consulta no banco de dados MV
#'
#' Executa a consulta SQL no banco de dados MV.
#'
#' @param sql Query com a instrução SQL a ser executada no banco de dados
#' @param alias_con Apelido, pré-cadastrado, da conexão a qual será executada a instrução SQL
#'
#' @return Tibble com o resultado da Query executada.
#'
#' @export
query <- function(sql, alias_con) {
    return(dplyr::tibble(ID = "1", SQL = sql, DB = alias_con))
}
