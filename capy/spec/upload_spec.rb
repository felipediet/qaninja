describe "upload de arquivos", :upload do
  before(:each) do
    visit "https://training-wheels-protocol.herokuapp.com/upload"
    @arquivo = Dir.pwd + "/spec/fixtures/arquivo.txt"
    @imagem = Dir.pwd + "/spec/fixtures/Wally.png"
  end

  it "upload com arquivo texto" do
    attach_file("file-upload", @arquivo)
    click_button("Upload")
    div_arquivo = find("#uploaded-file")
    expect(div_arquivo.text).to eql "arquivo.txt"
  end

  it "upload de imagem", :upload_imagem do
    attach_file("file-upload", @imagem)
    click_button("Upload")

    div_arquivo = find("#new-image")
    expect(div_arquivo[:src]).to include "Wally.png"
  end

  after(:each) do
    sleep 1
  end
end
