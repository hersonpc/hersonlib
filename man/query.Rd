% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/query.R
\name{query}
\alias{query}
\title{Executa consulta no banco de dados MV}
\usage{
query(sql, alias_con)
}
\arguments{
\item{sql}{Query com a instrução SQL a ser executada no banco de dados}

\item{alias_con}{Apelido, pré-cadastrado, da conexão a qual será executada a instrução SQL}
}
\value{
Tibble com o resultado da Query executada.
}
\description{
Executa a consulta SQL no banco de dados MV.
}
