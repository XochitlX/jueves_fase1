
class Board
#@@tablero_1 = [["POEMA", "CANCION", "RONDAS", "RIMAS"],"POEMAXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR"]
#@@tablero_1 = [["POEMA", "CANCION", "RONDAS", "RIMAS"],"AMEOPXCXXXXAXXSXNXAAXCMXDXIXXNROXXOXNXXR"]
#@@tablero_1 = [["MANGO", "SANDIA", "MELON", "PLATANO"],"XXXXPXXXXLXAMXAXIEXTXDLXAXNOXNMANGOXSXXX"]
@@tablero_1 = [["ROJO", "VERDE", "AZUL", "NEGRO"],"OJORXXXXXXXEXXOXDXRXXRGLXXEXUXNVXZXXXXAX"]

@@tablero = []  #array de tablero por filas
@@tablero_resuelto = Array.new(8) { Array.new(5) }
@@word = []
@@letter = []
@@selector = ""
@@selector_p = ""
@@nueva = ""

  def initialize
     complete_board!
     letters_and_words
     #p @@tablero_resuelto
  end

  def letters_and_words
    for palabra in 0..(@@tablero_1[0].length - 1)
      #p @@tablero_1[0]
      @@word[palabra] = @@tablero_1[0][palabra]
      @@letter[palabra] = @@word[palabra].chr
    end
  end

  def resolver
    for palabra_selec in 0..(@@word.length - 1)
      @@selector = @@word[palabra_selec]
      @@selector_p = @@letter[palabra_selec]
      for item in 1..5
        if item == 1
          horizontal_di(palabra_selec)
        elsif item == 2 
          horizontal_id(palabra_selec)  
        elsif item == 3            
          vertical_arab(palabra_selec)
        elsif item == 4
          vertical_abar(palabra_selec)
        elsif item == 5
          diagonal_1(palabra_selec)
        end
      end
      
    end
    @@tablero
    @@letter
    @@tablero_resuelto
    
    resultado = []
    @@tablero_resuelto.each { |item| resultado = resultado + item  }
    resultado = resultado.map { |item| (item == nil) ? item = "o" : item = "*"}*("")
    @@tablero_1[1] = resultado
    to_s
  end

  def diagonal_1(item)
    @@nueva = ""
    for row in 0..(@@tablero.length - 1)
      if @@tablero[row].join.include?(@@selector_p) == true
        lugar = @@tablero[row].index(@@selector_p)
        if (row - @@word.length) >= 0 && (lugar + @@word.length) <= 4
          count = @@word.length
          for fila in (row - @@word.length)..row
            @@nueva << @@tablero[fila][count + lugar]
            @@tablero_resuelto[fila][count + lugar] = "*"
            count -= 1
            end
        end
      end
    end
    @@nueva = @@nueva.reverse
  end
  
  def horizontal_di(item)
    @@nueva = ""
    for row in 0..(@@tablero.length - 1)
      if @@tablero[row].join.include?(@@selector)
        lugar = @@tablero[row].index(@@selector_p)
          for columna in lugar..(lugar + @@word.length)
            @@nueva << @@tablero[row][columna]
            @@tablero_resuelto[row][columna] = "*"
          end
      end
    end
    @@tablero_resuelto
    @@nueva 
  end

  def horizontal_id(item)
    @@nueva = ""
    for row in 0..(@@tablero.length - 1)
      if @@tablero[row].join.include?(@@selector.reverse)
        lugar = @@tablero[row].index(@@selector_p)
        for columna in (lugar + 1 - @@word.length)..lugar
            @@nueva << @@tablero[row][columna]
            @@tablero_resuelto[row][columna] = "*"
          end
      end
    end
    @@tablero_resuelto
    @@nueva = @@nueva.reverse
  end

  def vertical_arab(item)
    @@tablero = @@tablero.transpose
    @@tablero_resuelto = @@tablero_resuelto.transpose
    @@nueva = ""
    for row in 0..(@@tablero.length - 1)
      if @@tablero[row].join.include?(@@selector)
        lugar = @@tablero[row].index(@@selector_p)
        for columna in lugar..(lugar + @@word[item].length - 1)
          @@nueva << @@tablero[row][columna]
          @@tablero_resuelto[row][columna] = "*"
        end
      end
    end
    @@tablero = @@tablero.transpose
    @@tablero_resuelto = @@tablero_resuelto.transpose
    @@nueva
  end

  def vertical_abar(item)
    @@tablero = @@tablero.transpose
    @@tablero_resuelto = @@tablero_resuelto.transpose
    @@nueva = ""
    for row in 0..(@@tablero.length - 1)
      if @@tablero[row].join.include?(@@word[item].reverse)
        lugar = @@tablero[row].index(@@selector_p)
        for columna in (lugar - @@word[item].length + 1)..lugar
          @@nueva << @@tablero[row][columna]
          @@tablero_resuelto[row][columna] = "*"
        end
      end
      
    end
    @@tablero = @@tablero.transpose
    @@tablero_resuelto = @@tablero_resuelto.transpose
    @@nueva = @@nueva.reverse
  end


  def to_s # Tablero de 8*5
    linea_tab = []
    @@tablero_1[1] = @@tablero_1[1].split("")#.ljust(3)
    for item in 0..40
      if item % 5 == 0
        @@tablero << linea_tab 
        linea_tab = []
        print "\n"
      end
      linea_tab << @@tablero_1[1][item]
      print " #{@@tablero_1[1][item]} "
    end
    @@tablero = @@tablero.drop(1) #array de tablero por filas
    print "\n\n"
  end

  private

  def complete_board!
    #Este método debe rellenar un tablero incompleto, en otras palabras cambiar las "x" por letras random.
    #@@tablero_1[1] = @@tablero_1[1].gsub(/[X]/, '*') 
    abc = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    letras = 0
    for item in 0..(@@tablero_1[0].length - 1)
      letras = @@tablero_1[0][item].length + 1 + letras
    end
    
    for item in 0..letras
      random_abc = rand(26) 
      @@tablero_1[1] = @@tablero_1[1].sub(/[X]/, "#{abc[random_abc]}" ) #se llena tablero con letra aleatorias en lugar de X
    end 
  end
end


board = Board.new
#puts board
board.to_s
board.resolver
