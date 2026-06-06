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

meu_mpot <- function(f, v, i, fp, rendimento) {
  fator <- ifelse(f == 3, sqrt(3), 1)
  p_kw <- (fator * v * i * fp) / 1000

  if (is.null(rendimento)) {
    tipo <- "Potência Elétrica Ativa"
  } else {
    tipo <- "Potência Mecânica no Eixo"
    p_kw <- p_kw * rendimento
  }

  p_cv <- p_kw * 1.35962

  list(
    Tipo = tipo,
    kW = round(p_kw, 2),
    CV = round(p_cv, 2)
  )
}

meu_mdes <- function(correntes) {
  n <- length(correntes)

  if (n == 1) {
    warning("Motores monofásicos não possuem desbalanceamento de fase.")
    return(NA)
  } else if (n >= 2) {
    desbal <- (((max(correntes) / min(correntes)) - 1) * 100)
  }

  if (!is.na(desbal) && desbal > 5) {
    warning("ALERTA: Desbalanceamento acima de 5% (risco de superaquecimento).")
  }

  return(round(desbal, 2))
}


