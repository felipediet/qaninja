describe 'Tabelas', :tabs, :smoke do

    before(:each) do
        visit '/tables'
    end

    it 'deve exibir o salário do Tony Stark' do

        atores = all('table tbody tr') # retorna todos os elemnentos com o css selector

        #verifica e retorna se dentro da linha que o detect retornou existe o texto
            # como se fosse um for each
            stark = atores.detect { |ator| ator.text.include?('Robert Downey Jr') } 
            
            #Verifica se na linha do Robert Downey Jr contém 10.000.000
        expect(stark.text).to include '10.000.000'

    end

    it 'deve exibir o salário do vin diesel' do

            # retorna os elemnentos da tabela com o css selector apenas da linha que contém o texto que quero
        diesel= find('table tbody tr', text: '@vindiesel' ) 
                    
            #Verifica se na linha do Vin Diesel contém 10.000.000
        expect(diesel).to have_content '10.000.000'

    end


    
    it 'deve exibir o filme velozes' do

            # retorna os elemnentos da tabela com o css selector apenas da linha que contém o texto que quero
        diesel= find('table tbody tr', text: '@vindiesel' )

            # Retorna o conteudo da terceira coluna da tabela, array começa da posição 0
        movie = diesel.all('td')[2].text
                
            #Verifica se na coluna que pedi acima é igual a Velozes e Furiosos
        expect(movie).to eql 'Velozes e Furiosos'

    end

    it 'deve exibir o insta do chris evans' do

        evans = find('table tbody tr', text: 'Chris Evans' )

        insta = evans.all('td')[4].text

        expect(insta).to eql '@teamcevans'

    end

    it 'deve selecionar o Chris Pratt para remoção', :chris do

        chris = find('table tbody tr', text: '@prattprattpratt' )

        chris.find('a', text: 'delete').click

        msg = page.driver.browser.switch_to.alert.text  # Pega o texto da mensagem JS
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
        
    end

    it 'deve selecionar o Chris Pratt para edição', :chris2 do

        chris = find('table tbody tr', text: '@prattprattpratt' )

        chris.find('a', text: 'edit').click

        msg = page.driver.browser.switch_to.alert.text  # Pega o texto da mensagem JS
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
        
    end

end