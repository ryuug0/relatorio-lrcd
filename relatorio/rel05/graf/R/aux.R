# Funcoes auxiliares

meu_git <- function(msg) {

  # 1. Busca e renderiza todos os arquivos .qmd do projeto
  arquivos_qmd <- list.files(pattern = "\\.qmd$", recursive = TRUE, full.names = TRUE)
  if (length(arquivos_qmd) > 0) {
    message("=> Passo 1: Renderizando todos os arquivos .qmd...")
    for (qmd in arquivos_qmd) {
      message(paste("-> Renderizando:", basename(qmd)))
      system(paste("quarto render", shQuote(qmd)))
    }
  }

  # 2. Busca e dá knit em todos os arquivos .Rmd do projeto
  arquivos_rmd <- list.files(pattern = "\\.[Rr]md$", recursive = TRUE, full.names = TRUE)
  if (length(arquivos_rmd) > 0) {
    message("=> Passo 2: Knitando todos os arquivos .Rmd...")
    for (rmd in arquivos_rmd) {
      message(paste("-> Knitando:", basename(rmd)))
      rmarkdown::render(rmd, quiet = TRUE)
    }
  }

  # 3. Fluxo padrão do Git
  message("=> Passo 3: Enviando tudo para o GitHub...")
  system("git add .")

  comando_commit <- sprintf('git commit --allow-empty-message -m "%s"', msg)
  system(comando_commit)

  system("git push")
  message("=> Feito! Tudo atualizado e no ar.")
}
