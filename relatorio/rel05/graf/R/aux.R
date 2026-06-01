# Funcoes auxiliares

meu_git <- function(msg) {

  message("=> Passo 1: Renderizando com Quarto + Knitr...")

  # Garante que o pacote 'quarto' esta instalado para fazer a ponte com o knitr
  if (!requireNamespace("quarto", quietly = TRUE)) {
    install.packages("quarto")
  }

  # Executa a renderizacao nativa dentro do R
  quarto::quarto_render()

  message("=> Passo 2: Executando Git Add...")
  system("git add .")

  message("=> Passo 3: Executando Git Commit...")
  comando_commit <- sprintf('git commit --allow-empty-message -m "%s"', msg)
  system(comando_commit)

  message("=> Passo 4: Executando Git Push...")
  system("git push")

  message("=> Fluxo concluido com sucesso!")
}
