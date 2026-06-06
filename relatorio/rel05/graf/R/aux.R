# Funcoes auxiliares

meu_git <- function(msg) {
  # Roda tudo direto no terminal da pasta atual
  system("quarto render")
  system("git add .")

  comando_commit <- sprintf('git commit --allow-empty-message -m "%s"', msg)
  system(comando_commit)

  system("git push")
}
