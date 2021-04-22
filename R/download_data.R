#' Download data from the internet
#'
#' Baixa dados da internet para um repositório local, de uma forma mais segura,
#' evitando a quebra de informações acessadas diretamente.
#'
#' @param url Endereço na internet onde o dado esta disponível
#' @param csv_type Type 1 for "," separator or  2 for ";" separator

#' @return Tibble com os dados
#' @export
#'
#' @importFrom magrittr "%>%"
#' @importFrom utils read.csv
#' @importFrom utils read.csv2
#' @importFrom utils download.file
#'
#' @examples
#' url <- "https://docs.google.com/spreadsheets/d/e/<GOOGLE-SPREADSHEET-ID>
#' /pub?gid=<GID>&single=true&output=csv"
#' \dontrun{data <- download_data(url, csv_type = 1)}
download_data <- function(url, csv_type = 2) {
    # Referência ao pipe
    `%>%` <- magrittr::`%>%`

    if(stringr::str_trim(url) == "") {
        stop("Invalid URL.")
    }
    if(!dplyr::between(csv_type %>% as.integer(), 1, 2)) {
        stop("Invalid CSV Type.")
    }
    fetchSuccessfully <- FALSE
    tries <- 0
    while (!fetchSuccessfully & tries <= 10) {
        tryCatch({
            tries <- tries +1
            if(tries == 1) {
                usethis::ui_todo("Fetching data from the Internet...")
            } else {
                usethis::ui_todo(glue::glue("Fetching data from the Internet... Try {usethis::ui_value(tries)}"))
            }


            # Adiquirindo os dados
            tempFilename <- tempfile(fileext = ".csv")
            utils::download.file(url = url, tempFilename, mode = "wb", quiet = TRUE)
            usethis::ui_info(glue::glue("\tDownloaded: {usethis::ui_field(utils:::format.object_size(file.info(tempFilename)$size, 'auto'))}"))


            # Carregando os dados
            if(csv_type == 1) {
                output <-
                    read.csv(tempFilename, stringsAsFactors = FALSE, na.strings = c(""))
            } else if(csv_type == 2) {
                output <-
                    read.csv2(tempFilename, stringsAsFactors = FALSE, na.strings = c(""))
            }
            usethis::ui_info(glue::glue("\tStructure: {usethis::ui_value(nrow(output))} rows x {usethis::ui_value(ncol(output))} columns"))

            # Removendo arquivos temporários
            if(file.exists(tempFilename))
                file.remove(tempFilename)

            # Checando os dados adiquiridos
            fetchSuccessfully <- (nrow(output) > 2)
            if(fetchSuccessfully) {

                # Colunas sempre em maiusculas
                colnames(output) <- stringr::str_to_upper(colnames(output))

                usethis::ui_done("Data acquired successfully.")
                return(output %>% dplyr::as_tibble())
            }

        }, error = function(e) {
            message(e)
            fetchSuccessfully <- FALSE
        })
    }
}
