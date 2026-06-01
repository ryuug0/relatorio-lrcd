# Funcoes auxiliares

meu_git <- function(msg) {
  # Executa o quarto render
  system("quarto render")
  
  # Executa o git add
  system("git add .")
  
  # Adicionada a flag --allow-empty-message para permitir commits sem texto
  comando_commit <- sprintf('git commit --allow-empty-message -m "%s"', msg)
  system(comando_commit)
  
  # Executa o git push
  system("git push")
}