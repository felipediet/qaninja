describe 'Caixa de selecao', :dropdown do

    it 'item especifico simples', :simples do
        
        visit '/dropdown'

        select('Loki', from: 'dropdown')
    
    end


    it 'item especifico com o find', :especifico do
        visit '/dropdown'

        drop = find('.avenger-list')
        drop.find('option', text: 'Tony Stark').select_option

    end

    it 'qualquer item', :qualquer do
        visit '/dropdown'

        drop = find('.avenger-list')
        drop.all('option').sample.select_option
        sleep 3

    end

end