# Ruby é uma linguagem considerada puramente orientada a objetos
# Porque no Ruby tudo são objetos

# CLasse possui atributos e métodos
# Caracteristicas e Ações

# Carro (Nome, MArca, Modelo, Cor, Qtd Portas, etc...)
# Ações (Ligar, Businar, PArar, etc...)

class Carro
  # atributo
  attr_accessor :nome

  # método
  def ligar
    puts "O carro está ligado"
  end
end

civic = Carro.new
civic.nome = "Civic"

puts civic.nome
civic.ligar
