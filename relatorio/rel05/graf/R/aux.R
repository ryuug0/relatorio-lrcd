# Funcoes auxiliares

meu_git <- function(msg) {
  # Captura o caminho exato do arquivo .qmd aberto na sua tela
  arquivo <- rstudioapi::getActiveDocumentContext()$path

  # Roda no terminal do RStudio focado no arquivo certo e ESPERA terminar
  system(paste("quarto render", shQuote(arquivo)))

  # O Git só roda quando o render de cima chegar a 100%
  system("git add .")

  comando_commit <- sprintf('git commit --allow-empty-message -m "%s"', msg)
  system(comando_commit)

  system("git push")
}
