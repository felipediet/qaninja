describe 'Login com cadastro' do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/access'
    end

    it 'login com sucesso', :logincrud do

        # Escopo mais ou menos 
            # login_form = find('#login') # Procura o fortmulário Login

            #     # Procura os campos dentro do formulário de login
            #     login_form.find('input[name=username]').set 'stark'  # tipo do campo [atributo = valor do atributo]
            #     login_form.find('input[name=password]').set 'jarvis!'
            
            # click_button 'Entrar'

            # Escopo BONITO

            within('#login')  do # Procura o fortmulário Login

                find('input[name=username]').set 'stark'  # tipo do campo [atributo = valor do atributo]
                find('input[name=password]').set 'jarvis!'
        
                click_button 'Entrar'
            end 

            # # contém no texto
            expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'cadastro com sucesso', :logincrud_cadastro do

        
        within('#signup')  do # Procura o fortmulário Cadastro

            find('input[name=username]').set 'diet'  # tipo do campo [atributo = valor do atributo]
            find('input[name=password]').set '123Aa321'
    
            click_link 'Criar Conta'
        end
        
        # # contém no texto
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
        

    end

end