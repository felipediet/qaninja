require 'spec_helper'

describe 'Select2' do

    describe('single', :single) do
            before(:each) do
                visit 'https://training-wheels-protocol.herokuapp.com/apps/select2/single.html'
            end

        it 'seleciona ator por nome' do
            find('.select2-selection--single').click
            find('.select2-results__option', text: 'Adam Sandler').click
        end

        it 'busca por nome' do
            find('.select2-selection--single').click
            find('.select2-search__field').set 'Crhis Rock'
            find('.select2-results__option').click
        end

    end

    describe('multiple', :multi) do
        before(:each) do
                visit 'https://training-wheels-protocol.herokuapp.com/apps/select2/multi.html'
            end

            def seleciona(ator)
                find('.select2-selection--multiple').click
                find('.select2-search__field').set ator
                find('.select2-results__options').click
                sleep 2
            end

            it 'seleciona ator por nome' do
                seleciona('Kevin James')
                seleciona('Owen Wilson')

                # find('.select2-selection--multiple').click
                # find('.select2-search__field').set 'Kevin James'
                # find('.select2-results__options').click
                # find('.select2-selection--multiple').click
                # find('.select2-search__field').set 'Owen Wilson'
                # find('.select2-results__options').click

                atores = ['Kevin James', 'Owen Wilson', 'Crhis Rock']

                atores.each do |a|
                    seleciona(a)
                end
            end
    end
end