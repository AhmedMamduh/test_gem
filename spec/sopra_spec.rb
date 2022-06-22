RSpec.describe Sopra do

  let!(:new_obj) do
    att = {'log_url': 'http://logging.example'}
    Sopra::Configuration.new(att)
  end

  it "`get` returns the stored value (nil for non-existing)" do
    new_obj.set(:log_url, 'http://logging.example')
    expect(new_obj.get(:log_url_2)).to eq nil
  end

  it "`set` stores the data inside the instance" do
    new_obj.set(:log_url, 'http://logging.example')
    expect(new_obj.get(:log_url)).to eq 'http://logging.example'
  end

  it "`set` may receive a block for the value" do
    value = -> { "env_domain" }
    new_obj.set(:domain, value)
    expect(new_obj.get(:domain)).to eq 'env_domain'
  end

  let!(:initialized_instance) do
    Sopra::Configuration.new.tap do |s|
      s.set(:logo_url, 'http://logging.example')
    end
  end

  it "the class may be initialized with a block" do
    expect(initialized_instance.get(:logo_url)).to eq 'http://logging.example'
  end

end
