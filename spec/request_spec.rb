require_relative '../lib/request'

describe Request do
  describe 'request' do
    let(:properties_response) { Request.properties() }
    it "returns correctly data" do
      expect(properties_response).to be_kind_of(Hash)
      expect(properties_response).to have_key("pagination")
      expect(properties_response["content"].first).to have_key("title")
    end
  end
end

describe 'get_titles' do
  let(:properties_response) { Request.properties() } 
  it 'returns titles data correctly' do
    titles = get_titles(properties_response)
    expect(titles).to be_an(Array)
    expect(titles.first).to eq("Casa en Venta Amorada en Santiago Nuevo Leon")
    expect(titles).to include("Beautiful property in Condesa.")
  end
end

