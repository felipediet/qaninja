require 'spec_helper'

describe 'Alertas de JS', :alerts do
    
    before(:each) do
        visit '/javascript_alerts'
    end

    it 'alerta' do
        click_button "Alerta"

        msg = page.driver.browser.switch_to.alert.text  # Pega o texto da mensagem JS
        expect(msg).to eql 'Isto é uma mensagem de alerta'               
    end

    it 'sim confirma' do
        click_button "Confirma"

        msg = page.driver.browser.switch_to.alert.text # Pega o texto da mensagem JS
        
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept #Clica em sim

        expect(page).to have_content 'Mensagem confirmada'
    end


    it 'não confirma' do
        click_button "Confirma"

        msg = page.driver.browser.switch_to.alert.text # Pega o texto da mensagem JS
        
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.dismiss #Clica em não

        expect(page).to have_content 'Mensagem não confirmada'
    end


    it 'accept prompt', :prompt do
        
        def prompt(nome)
            accept_prompt(with: (nome)) do
                click_button 'Prompt'
                # sleep 2
            end
            
            expect(page).to have_content 'Olá, ' + (nome)
        end

        nome = ['Diet', 'Dani', 'Oli']

        nome.each do |n|
            prompt(n)
            sleep 3
        end
    end

    it 'dismiss prompt', :prompt_canc do
        
        dismiss_prompt() do
                click_button 'Prompt'
                # sleep 2
        end
        
        expect(page).to have_content 'Olá, null'
        # sleep 3
    end

end