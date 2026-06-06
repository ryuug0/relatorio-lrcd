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

#' Cálculo de Potência de Motores Elétricos
#'
#' \code{mpot} calcula a potência elétrica ativa ou a potência mecânica no eixo (se o rendimento for informado).
#' @param f Número de fases (1, 2 ou 3).
#' @param v Tensão de alimentação (Volts).
#' @param i Corrente elétrica (Amperes).
#' @param fp Fator de potência.
#' @param rendimento Rendimento do motor (opcional, entre 0 e 1).
#' @return Lista com o tipo de potência e valores em kW e CV.
#' @examples
#' library(graf)
#' # mpot(3, 380, 14.8, 0.85)
#' # mpot(3, 380, 14.8, 0.85, 0.90)
#' @export
mpot <- function(f, v, i, fp, rendimento = NULL) {
  res <- meu_mpot(f, v, i, fp, rendimento)
  return(res)
}

#' Cálculo de Desbalanceamento de Correntes
#'
#' \code{mdes} calcula o desbalanceamento percentual baseado na razão entre a maior e a menor corrente lida, alertando se ultrapassar 5%.
#' @param correntes Vetor numérico com as correntes (ex: c(13.5, 12.1, 14.0)).
#' @return O desbalanceamento em porcentagem.
#' @examples
#' library(graf)
#' # mdes(c(14.8, 15.2, 14.1))
#' @export
mdes <- function(correntes) {
  res <- meu_mdes(correntes)
  return(res)
}
