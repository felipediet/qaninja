
class Conta # objetos e metodos comuns
        #objetos
        attr_accessor :saldo, :mensagem

        #método
        def initialize(saldo)
            self.saldo = saldo
        end

    #método
    def saca(valor, max, taxa)
        if (valor > self.saldo)
            self.mensagem = 'Saldo insuficiente para saque :('
        elsif (valor > max)
            self.mensagem = 'Limite maximo por saque e de RS ' + max.to_s
        else
            self.saldo -= valor + taxa
        end
    end
end


class ContaCorrente < Conta # herda de conta

    #reaproveitamento de metodo
    def saca(valor, max = 700, taxa = 5.00)
        super # procura o metodo na classe pai
    end

end



class ContaPoupanca < Conta

    #reaproveitamento de metodo
    def saca(valor, max = 500, taxa = 2.01)
        super # procura o metodo na classe pai
    end

end