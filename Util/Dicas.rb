
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