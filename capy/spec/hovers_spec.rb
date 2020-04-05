describe 'Mouse Hover', :hovers do

    before(:each) do
        # visit '/dynamic_controls'
        visit '/'
        find('li', text: 'Hovers').click_link
    end

        it 'quando passa o mouse sobre o blade' do
            
            # Contém Blade
            card = find('img[alt*=Blade]')
            card.hover
            
            expect(page).to have_content 'Nome: Blade'

        end


        
        it 'quando passa o mouse sobre o Pantera Negra' do
            
            # Começa com Pantera
            card = find('img[alt^=Pantera]')
            card.hover
            
            expect(page).to have_content 'Nome: Pantera Negra'

        end


        it 'quando passa o mouse sobre o Homem Aranha' do
            
            # Termina com Aranha
            card = find('img[alt$=Aranha]')
            card.hover
            
            expect(page).to have_content 'Nome: Homem Aranha'

        end


    after(:each) do
        sleep 2
    end

end