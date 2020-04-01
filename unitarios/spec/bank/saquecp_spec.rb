
# linka com o arquivo onde está a classe, métodos e objetos
require_relative '..\..\app\bank.rb'

describe ContaPoupanca do

    describe 'Saque' do
        context 'quando o valor é positivo' do
            before(:all) do
                @contacp = ContaPoupanca.new(1000.00)
                @contacp.saca(200.00)
            end
            it 'entao atualiza saldo' do
                expect(@contacp.saldo).to eql 798.00
            end

        end

        context 'quando o saldo é zero' do

            before(:all) do
                @contacp = ContaPoupanca.new(0.00)
                @contacp.saca(100.00)
            end
            it 'vejo mensagem' do
                expect(@contacp.mensagem).to eql 'Saldo insuficiente para saque :('
            end
            it 'meu saldo permmanece zerado' do
                expect(@contacp.saldo).to eql 0.00
            end

        end


        context 'quando o saldo é insuficiente' do

            before(:all) do
                @contacp = ContaPoupanca.new(100.00)
                @contacp.saca(101.00)
            end
            it 'vejo mensagem' do
                expect(@contacp.mensagem).to eql 'Saldo insuficiente para saque :('
            end
            it 'meu saldo permmanece o mesmo' do
                expect(@contacp.saldo).to eql 100.00
            end

        end


        context 'quando o valor do saque é maior que o limite por transação' do
            before(:all) do
                @contacp = ContaPoupanca.new(1000.00)
                @contacp.saca(701.00)
            end
            it 'vejo mensagem' do
                expect(@contacp.mensagem).to eql 'Limite maximo por saque e de RS 500'
            end
            it 'meu saldo permmanece o mesmo' do
                expect(@contacp.saldo).to eql 1000.00
            end
        end




    end

end