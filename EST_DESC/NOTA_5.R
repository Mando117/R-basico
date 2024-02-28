# Creación de Arrays
my_array <- array(1:18, dim = c(3, 3, 2))
print("Array Creado:")
print(my_array)

# Acceder a Elementos del Array
elemento <- my_array[2, 3, 1]
cat("\nElemento en la 2ª fila, 3ª columna y 1ª capa:", elemento, "\n")

# Operaciones Aritméticas con Arrays
my_array_times_two <- my_array * 2
print("\nArray multiplicado por 2:")
print(my_array_times_two)

# Aplicar Funciones a Marginales
col_sums <- apply(my_array[,,1], 2, sum)
cat("\nSuma de cada columna en la 1ª capa:", col_sums, "\n")


apply(mi_array, MARGIN = c(2, 3), FUN = sum)
apply(mi_array, MARGIN = c(1, 3), FUN = sum)
apply(mi_array, MARGIN = 3, FUN = sum)





  # Array a Matriz
first_layer_as_matrix <- matrix(my_array[,,1], nrow = 3, ncol = 3)
print("\nPrimera capa del array como matriz:")
print(first_layer_as_matrix)

# Número de puntos aleatorios a generar
N <- 1000

# Genera N puntos aleatorios en un cuadrado de lado 2 (-1 a 1 en ambos ejes)
# Luego, calcula la suma de los cuadrados de sus coordenadas
u <- runif(N, -1, 1) |>
  matrix(ncol = 2) |>
  apply(1, function(x) {sum(x**2)})

# Calcula la proporción de puntos que están dentro del círculo unitario
# (donde la suma de los cuadrados de sus coordenadas es menor o igual a 1)
# y multiplica esa proporción por 4 para estimar pi.
estimado_pi <- mean(u < 1) * 4
estimado_pi





f <- 1000
c <- 2
r <- 1000

N <- f*c*r
u <- runif(N,-1,1) |>
  array(dim = c(f, c, r)) |>
  apply(MARGIN = c(1,3),function(x) {sum(x**2)}) |>
  apply(MARGIN = 1, function(x){mean(x<1)*4})

mean(u)
hist(u)




# Crear un data frame a partir de los estimadores
df_pi <- data.frame(estimations = u)

# Graficar histograma de las estimaciones
ggplot(df_pi, aes(x = estimations)) +
  geom_histogram(fill = "blue", color = "black", bins = 30, alpha = 0.7) +
  geom_vline(aes(xintercept = pi), color = "red", linetype = "dashed", size = 1) +
  labs(title = "Histograma de Estimaciones de π", 
       x = "Valor Estimado", 
       y = "Frecuencia",
       subtitle = paste("Línea roja representa π real:", pi)) +
  theme_minimal()







