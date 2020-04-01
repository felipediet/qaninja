describe 'Caixa de selecao', :dropdown do

    it 'item especifico simples', :simples do
        
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'

        select('Loki', from: 'dropdown')
    
    end


    it 'item especifico com o find', :especifico do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'

        drop = find('.avenger-list')
        drop.find('option', text: 'Tony Stark').select_option

    end

    it 'qualquer item', :qualquer do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'

        drop = find('.avenger-list')
        drop.all('option').sample.select_option
        sleep 3

    end

end