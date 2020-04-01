
# try catch do Ruby

# begin
#     # devo tentar alguma coisa
#     file = File.open("./ola.txt")
#     if file
#         puts file.read
#     end

# rescue Exception => e
#     # obter um possível erro
#     puts e.message
#     puts e.backtrace
# end

class Oper

    def soma(n1, n2)
        n1 + n2
    rescue Exception => e
        puts 'Erro ao executar a soma.'
        # puts e.message
        # puts e.backtrace
    end

    def multiplicacao(n1, n2)
        n1 * n2
    rescue Exception => e
        puts 'Erro ao executar a multiplicacao.'
        # puts e.message
        # puts e.backtrace
    end

end

op = Oper.new

puts op.soma(5,5)

puts op.multiplicacao(2,'C')


