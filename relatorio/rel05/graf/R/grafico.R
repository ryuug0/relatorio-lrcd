#' Automatizar Renderizacao e Comandos do Git
#'
#' \code{git} executa o quarto render e sequencialmente os comandos add, commit e push.
#' @param comentario mensagem do commit. Se omitido, envia um espaco em branco.
#' @return Executa os comandos no sistema.
#' @examples
#' library(graf)
#' # git()
#' # git(versao_3)
#' @export
git <- function(comentario) {
  if (missing(comentario)) {
    msg <- " "
  } else {
    texto <- deparse(substitute(comentario))
    msg <- gsub("[\"']", "", texto)
  }
  
  res <- meu_git(msg)
  return(res)
}