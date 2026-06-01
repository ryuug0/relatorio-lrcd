# Funcoes auxiliares

meu_git <- function(msg) {

  # 1. Feedback visual do Quarto
  message("=> Passo 1: Executando Quarto Render...")

  # Tenta usar o pacote oficial do R para renderizar (mais seguro)
  if (requireNamespace("quarto", quietly = TRUE)) {
    quarto::quarto_render()
  } else {
    # Se nao tiver o pacote instalado, usa o terminal do sistema
    system("quarto render")
  }

  # 2. Feedback do Git Add
  message("=> Passo 2: Executando Git Add...")
  system("git add .")

  # 3. Feedback do Git Commit
  message("=> Passo 3: Executando Git Commit...")
  comando_commit <- sprintf('git commit --allow-empty-message -m "%s"', msg)
  system(comando_commit)

  # 4. Feedback do Git Push
  message("=> Passo 4: Executando Git Push...")
  system("git push")

  message("=> Fluxo concluido com sucesso!")
}
