describe 'Mouse Hover', :drop do

    before(:each) do
        # visit '/dynamic_controls'
        visit '/'
        find('li', text: 'Drag and Drop').click_link
    end

        it 'Homem Aranha pertence ao time do Stark' do
            
        stark = find('.team-stark .column')
        cap = find('.team-cap .column')

        spiderman = find ('img[alt*=Aranha]')
        spiderman.drag_to stark

        expect(stark).to have_css 'img[alt*=Aranha]'
        expect(cap).not_to have_css 'img[alt*=Aranha]'

        end


    after(:each) do
        sleep 2
    end

end