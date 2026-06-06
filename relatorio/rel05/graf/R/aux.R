# Funcoes auxiliares

meu_git <- function(msg) {

  message("=> Passo 1: Detectando arquivo e renderizando com Quarto...")

  # Inicializa a variavel do arquivo
  arquivo_para_renderizar <- NULL

  # Pega o caminho do arquivo que esta aberto e focado na sua tela do RStudio
  if (requireNamespace("rstudioapi", quietly = TRUE) && rstudioapi::isAvailable()) {
    ctx <- rstudioapi::getActiveDocumentContext()
    if (!is.null(ctx) && grepl("\\.qmd$", ctx$path, ignore.case = TRUE)) {
      arquivo_para_renderizar <- ctx$path
    }
  }

  # Renderiza o arquivo focado ou a pasta atual caso nao encontre
  if (!is.null(arquivo_para_renderizar)) {
    message(paste("-> Renderizando o arquivo ativo:", basename(arquivo_para_renderizar)))
    quarto::quarto_render(input = arquivo_para_renderizar)
  } else {
    message("-> Nenhum arquivo .qmd ativo focado. Tentando renderizar a pasta atual...")
    quarto::quarto_render()
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
