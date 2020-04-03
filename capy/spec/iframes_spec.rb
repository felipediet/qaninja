describe 'iframes' do

    describe 'bom', :nice_iframe do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/nice_iframe'
        end

            it 'adicionar ao carrinho' do

                    within_frame('burgerId')  do # Procura o iframe com o ID burgerId
                        
                        produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                        produto.find('a').click
                        expect(find('#cart')).to have_content 'R$ 4,50'
                        sleep 5                   
                    end 
                   
            end    

    end

    
    describe 'ruim', :bad_iframe do
        before(:each) do
            visit 'https://training-wheels-protocol.herokuapp.com/bad_iframe'
        end

            it 'adicionar ao carrinho' do

                    script = '$(".box-iframe").attr("id", "iframeruim");' 
                    page.execute_script(script)

                    within_frame('iframeruim')  do # Procura o iframe com a classe box-iframe
                        
                        expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
                        sleep 3
                    end 
                   
            end    

    end

    
end