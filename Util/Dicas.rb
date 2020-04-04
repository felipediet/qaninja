
# Manipular IFRAME como adicionar um ID usando a classe do mesmo

# Pelo console

    $(".box-iframe"); # Localiza a classe
    $(".box-iframe").attr("id", "iframeruim"); # Add o atributo id no iframe ou qualquer outra coisa

        # Adicionar o atributo via script de JQUERY
            script = '$(".box-iframe").attr("id", "iframeruim");'
            page.execute_script(script)

        # Procura o iframe com o id iframeruim (Só busca por ID)
            within_frame('iframeruim')  do
                
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
                sleep 3
            end 

# Escopo usado para quando vc tem um login e um cadastro na mesma tela com oas mesmos ID e ou names

        # Procura o fortmulário com  ID login, pode usar .classe tb
            within('#login')  do 

                find('input[name=username]').set 'stark'  # tipo do campo [atributo = valor do atributo]
                find('input[name=password]').set 'jarvis!'

                click_button 'Entrar'
            end 

        # Procura o iframe com o id iframeruim (Só busca por ID
            within_frame('iframeruim')  do )

            end


# Utilizar quando Ids Dinâmicos

        # Procura um input onde o ID que termina com
            find('input[id$=UsernameInput]').set 'diet'
            
        # Procura um input onde o ID que começa com
            find('input[id^=UsernameInput]').set '123456'
            
        # Procura um a onde o ID que contem
            find('a[id*=GetStartedButton]').click


# Alertas JS

        # Pega o texto da mensagem JS
            msg = page.driver.browser.switch_to.alert.text  
            expect(msg).to eql 'Isto é uma mensagem de alerta'



# localização de texto em tabelas


    # localização de texto em tabelas procurando em várias linhas
    
        # retorna todos os elemnentos com o css selector
            atores = all('table tbody tr')

        # verifica e retorna se dentro da linha que o detect retornou existe o texto
        # como se fosse um for each
            stark = atores.detect { |ator| ator.text.include?('Robert Downey Jr') } 
                
        # Verifica se na linha do Robert Downey Jr contém 10.000.000
            expect(stark.text).to include '10.000.000'

   
            
    # localização de texto em tabelas procurando em linha específica

        # retorna os elemnentos da tabela com o css selector apenas da linha que contém o texto que quero
            diesel= find('table tbody tr', text: '@vindiesel' ) 
                        
        #Verifica se na linha do Vin Diesel contém 10.000.000
            expect(diesel).to have_content '10.000.000'


    
    # localização de texto em tabelas procurando em linha e coluna específica

        # retorna os elemnentos da tabela com o css selector apenas da linha que contém o texto que quero
            diesel= find('table tbody tr', text: '@vindiesel' )

        # Retorna o conteudo da terceira coluna da tabela, array começa da posição 0
            movie = diesel.all('td')[2].text
                    
        # Verifica se na coluna que pedi acima é igual a Velozes e Furiosos
            expect(movie).to eql 'Velozes e Furiosos'


    # Localiza texto do botão/link na tabela e clica no mesmo

            chris = find('table tbody tr', text: '@prattprattpratt' )

            chris.find('a', text: 'delete').click

            msg = page.driver.browser.switch_to.alert.text  # Pega o texto da mensagem JS
            expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'