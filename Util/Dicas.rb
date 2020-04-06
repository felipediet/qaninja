

# Relatório com evidências
    # Para rodar excutar o comando abaixo:

    #cucumber --format html --out=relatorio.html -t @TAG

    # O comando abaixo tira as evidenccias dos testes...manter a penultima linha comentado para não apagar as evidencias
        AfterStep do |scenario|
        screenshot = "#{SecureRandom.urlsafe_base64(6)}.png"
        page.save_screenshot(screenshot)
        embed(screenshot, "image/png", "Step Result")
        # FileUtils.rm_rf(screenshot)
        end





# URL padrão

    # dentro do spec_helper, dentro da escopo Capybara

    Capybara.configure do |config|
        config.default_driver = :selenium_chrome
    # tempo padrão que o sistema aguarda entre as execuções
        config.default_max_wait_time = 5 
    # URL padrão da aplicação, no before usar apenas o /página
        config.app_host = 'https://training-wheels-protocol.herokuapp.com' 
    end


# configurar resolução padrão 
    
    # dentro do spec_helper, dentro da escopo RSPEC

    config.before(:example) do
        page.current_window.resize_to(1280, 800)
    end


# tira evidência no final do teste
    config.after(:example) do |e|
        nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ', '_')
        page.save_screenshot('log/' + 'Erro_cenario_' + nome + '.png') if e.exception
    end


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