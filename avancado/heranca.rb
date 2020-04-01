
# Classe principal
class Veiculo
        # atributo
        attr_accessor :nome, :marca, :modelo

        def initialize (nome, marca, modelo)
            self.nome = nome
            self.marca = marca
            self.modelo = modelo
        end

        # metodo
        def ligar
        puts "#{nome} está pronto para iniciar o trajeto."
        end

        # metodo
        def businar
            puts 'Beep! Beep!'
        end

end

# Classe especifica que herda a principal
class Carro < Veiculo
    # metodo
    def dirigir
        puts "#{nome} iniciando o trajeto."
    end
end

# Classe especifica que herda a principal
class Moto < Veiculo
        # metodo
        def pilotar
            puts "#{nome} iniciando o trajeto."
        end

    end


civic = Carro.new('Civic','Honda','S1')
civic.ligar
civic.businar
civic.dirigir

lancer = Carro.new('Lancer','Mitsubish','EVO')
lancer.ligar
lancer.businar
lancer.dirigir

fazer = Moto.new('Fazer','Yamaha','250cc')
fazer.ligar
fazer.businar
fazer.pilotar