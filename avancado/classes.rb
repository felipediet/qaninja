class Conta
    
    attr_accessor :saldo, :nome

    def initialize(nome) # metodo construtor
        self.saldo = 0.0
        self.nome = nome 
    end
    
    def  deposita(valor)
        # puts 'Depositando a quantida de ' + valor.to_s + ' reais.' #Necessário conversão para string
        
        self.saldo += valor  # invocar atributo dentro da classe, análogo ao .this
        puts "Depositando a quantida de #{valor} reais,
         na conta de #{self.nome}." #Converte automatico
    end

end


c = Conta.new('Diet')

c.deposita(100.00)

puts c.saldo

c.deposita(10.00)

puts c.saldo
puts c.nome