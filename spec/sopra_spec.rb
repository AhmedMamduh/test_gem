RSpec.describe Sopra do

  let!(:new_obj) do
    att = {'log_url': 'http://logging.example'}
    Sopra::Configuration.new(att)
  end

  it "set and get value" do
    new_obj.set('log_url', 'http://logging.example')
    expect(new_obj.get(:log_url)).to eq 'http://logging.example'
  end

  it "get nil value" do
    new_obj.set('log_url', 'http://logging.example')
    expect(new_obj.get(:log_url_2)).to eq nil
  end

  it "set by a block" do
    new_obj.set do |s|
      s.atts = {
        'domain': 'env_domain'
      }
    end
    expect(new_obj.atts[:domain]).to eq 'env_domain'
  end

  let!(:init) do
    Sopra::Configuration.new.tap do |s|
      s.set :logo_url, 'http://logging.example'
    end
  end

  it "init by block" do
    expect(init.get(:logo_url)).to eq 'http://logging.example'
  end

end
