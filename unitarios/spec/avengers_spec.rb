
class AvengersHeadQuarter
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(avenger)
    self.list.push(avenger)
  end
end

#TDD (DEsenvolviento guiado por testes)
describe AvengersHeadQuarter do
    it "deve eadicionar um vingador" do
            hq = AvengersHeadQuarter.new

            hq.put("Spiderman")
            expect(hq.list).to eql ["Spiderman"]
    end

    it "deve adicionar uma lista de vongadores" do
        hq = AvengersHeadQuarter.new
        hq.put("Thor")
        hq.put("Hulk")
        hq.put("Spiderman")

        # #verifica se a lista possui conteudo
        # (
        res = hq.list.size > 0 
        expect(res).to be true
        # )

        expect(hq.list.size).to be > 0 #verifica se a lista possui conteudo
        expect(hq.list).to include "Hulk" #verifica se Hulk foi adicionado na lista
    end

    it 'thor deve ser o primeiro da lista' do
    
            hq = AvengersHeadQuarter.new
            hq.put("Thor")
            hq.put("Hulk")
            hq.put("Spiderman")

            expect(hq.list).to start_with('Thor')
    end

    it 'ironman deve ser o ultimo da lista' do
    
        hq = AvengersHeadQuarter.new
        hq.put("Thor")
        hq.put("Hulk")
        hq.put("Spiderman")
        hq.put("Ironman")

        expect(hq.list).to end_with('Ironman')
    end

    it 'deve conter o sobrenome' do
            avenger = 'Peter Parker'

            expect(avenger).to match(/Parker/)
            expect(avenger).not_to match(/Diet/)

    end
    
    

end
