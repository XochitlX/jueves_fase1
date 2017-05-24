#Gato
def gato #revuelve
  random_number = rand(2) #when 1=x, 0=o
  (random_number == 1) ? gato = (Array.new(5){ |item| "x" } + Array.new(4){ |item| "o" }).sort_by { rand } : gato = (Array.new(4){ |item| "x" } + Array.new(5){ |item| "o" }).sort_by { rand }
  imprime(gato)
end

def imprime(tablero)
  tablero = tablero.each_slice(3)
  for arr in 0..2
    print "|  #{tablero.next*(" ")}  |\n"
  end
end

gato

#Tabla de Datos
table = [ ["Nombre", "Edad", "Genero", "Grupo", "Calificaciones"],
          ["Rodrigo García", 13, "Masculino", "Primero", [9, 9, 7, 6, 8]],
          ["Fernanda Gonzalez", 12, "Femenino", "Tercero", [6, 9, 8, 6, 8]],
          ["Luis Perez", 13, "Masculino", "Primero", [8, 7, 7, 9, 8]],
          ["Ana Espinosa", 14,"Femenino", "Segundo", [9, 9, 6, 8, 8]],
          ["Pablo Moran", 11, "Masculino", "Segundo", [7, 8, 9, 9, 8]] ]

big_table = []
for group in 1..(table.length - 1)
  for item in 0..4
    big_table << [table[0][item], table[group][item]]
  end
end

dato_hash = []
big_table = big_table.each_slice(5)

for arreglos in 0..4
  segmento = big_table.next
  dato_hash << Hash[segmento]
end
p dato_hash
