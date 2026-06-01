# Funcoes auxiliares

meu_git <- function(msg) {

  message("=> Passo 1: Executando Quarto Render...")

  # Executa e captura se o comando rodou com sucesso (0 significa sucesso)
  status_quarto <- system("quarto render", wait = TRUE)

  if (status_quarto != 0) {
    stop("O Quarto nao conseguiu gerar o HTML. Verifique o erro acima no console.")
  }

  message("=> Passo 2: Executando Git Add...")
  system("git add .")

  message("=> Passo 3: Executando Git Commit...")
  comando_commit <- sprintf('git commit --allow-empty-message -m "%s"', msg)
  system(comando_commit)

  message("=> Passo 4: Executando Git Push...")
  system("git push")

  message("=> Fluxo concluido com sucesso!")
}
