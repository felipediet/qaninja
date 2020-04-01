
# linka com o arquivo onde está a classe, métodos e objetos
require_relative '..\..\app\bank.rb'

describe ContaCorrente do

    describe 'Saque' do
        context 'quando o valor é positivo' do
            before(:all) do
                @contacc = ContaCorrente.new(1000.00)
                @contacc.saca(200.00)
            end
            it 'entao atualiza saldo' do
                expect(@contacc.saldo).to eql 795.00
            end

        end

        context 'quando o saldo é zero' do

            before(:all) do
                @contacc = ContaCorrente.new(0.00)
                @contacc.saca(100.00)
            end
            it 'vejo mensagem' do
                expect(@contacc.mensagem).to eql 'Saldo insuficiente para saque :('
            end
            it 'meu saldo permmanece zerado' do
                expect(@contacc.saldo).to eql 0.00
            end

        end


        context 'quando o saldo é insuficiente' do

            before(:all) do
                @contacc = ContaCorrente.new(100.00)
                @contacc.saca(101.00)
            end
            it 'vejo mensagem' do
                expect(@contacc.mensagem).to eql 'Saldo insuficiente para saque :('
            end
            it 'meu saldo permmanece o mesmo' do
                expect(@contacc.saldo).to eql 100.00
            end

        end


        context 'quando o valor do saque é maior que o limite por transação' do
            before(:all) do
                @contacc = ContaCorrente.new(1000.00)
                @contacc.saca(701.00)
            end
            it 'vejo mensagem' do
                expect(@contacc.mensagem).to eql 'Limite maximo por saque e de RS 700'
            end
            it 'meu saldo permmanece o mesmo' do
                expect(@contacc.saldo).to eql 1000.00
            end
        end




    end

end