###################
# Aula sobre o leem
###################

# Anexar o pacote leem
library(leem)

# Visualizar a interface do pacote (Em desenvolvimento)
leem()

# Semente
set.seed(10)

# Estatistica descritiva
dados <- rnorm(1000, mean = 100, sd = 2)

# Tabulacao
tab <- dados |>
  new_leem(variable = 2) |>
  tabfreq(k = 3); tab

# Criar graficos
################

# Histograma
tab |>
  hist(
    freq = "n", # tipo da frequencia
    bg = FALSE,  # Sem/com fundo
    barcol = heat.colors(7), # Cores nas barras
    xlab = "Variavel X"
  )

# Ogivas
tab |>
  ogive(
    bars = TRUE, # Inserir barras de fac1/2
    both = TRUE,
    barcol = c("blue", "yellow"), # cor da barra
    lpcol = "red", # cor da linha
    pch = 8 # Tipo dp ponto
  ) |>
  insert(
    type = "median",
    lcol = "green",
    ptext = 0.15
  )

# Grafico de pizza
tab |>
  piechart()


# Medidas de posicao
tab |>
  mpos(grouped = FALSE)

# Medidas de dispersao
## Variance
tab |>
  variance()
## Desvio padrao
tab |>
  sdev()
## CV
tab |>
  cv()

# Probabilidade
## Funcao de distribuicao (Normal)
P(-1 %<=X<=% 1, mean = 0, sd = 1, gui = "tcltk")
## Funcao de distribuicao (Binomial)
P(5, dist = "binomial", size = 10, prob = 0.5 )



nullhyp <- h0 <- 90
set.seed(10)
data <- rnorm(30, 100, 10)
th(data, h0 = h0, sd = 10, plot = TRUE)
