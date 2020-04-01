describe 'Login random', :login2 do

    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/login2'
    end

    it 'login com data de nascimento' do

        find('#userId').set 'stark'
        find('#passId').set 'jarvis!'

        login_form = find('#login')

        case login_form.text      # No console rodar   $('#login').text();
            when /Dia/
                find('#day').set '29'
            when /Mês/
                find('#month').set '05'
            when /Ano/
                find('#year').set '1970'
        end

        click_button 'Login'

        expect(find('#flash').visible?).to be true

        # # compara stings com o contains
        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'

        # # contém no texto
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'

    end

    # it 'senha incorreta' do
    #     visit 'https://training-wheels-protocol.herokuapp.com/login'

    #     fill_in 'userId', with: 'stark' # ID
    #     fill_in 'password', with: 'jarvis@' # NAME

    #     click_button 'Login'

    #     expect(find('#flash')).to have_content 'Senha é invalida!'

    # end
    

    # it 'usuário não cadastrado' do
        
    #     visit 'https://training-wheels-protocol.herokuapp.com/login'

    #     fill_in 'userId', with: 'thor' # ID
    #     fill_in 'password', with: 'mjolnir' # NAME

    #     click_button 'Login'

    #     expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!'
        
    # end

end