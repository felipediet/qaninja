describe 'IDs Dinâmicos', :iddinamico do

        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/access'
        end

        it 'cadastro' do

            # find('#PortalTheme_wt10_block_wtcontent_holder_wt8_wtUsernameInput').set 'diet'
            find('input[id$=UsernameInput]').set 'diet' # Procura o ID que termina com
            
            # find('#PasswordInput_wt11_PortalTheme_wt7_block_wtcontent_holder_wt8_wt').set '123456'
            find('input[id^=PasswordInput]').set '123456' # Procura o ID que começa com
            
            # find('#PortalTheme_wt4_block_wtGetStartedButton_wtcontent_holder_OSCore_wt3_block').click
            find('a[id*=GetStartedButton]').click # Procura o ID que contem

            expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
            sleep 3
            

                   
        end


    
end