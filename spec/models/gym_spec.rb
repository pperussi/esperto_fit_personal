require 'rails_helper'

describe Gym do
  it 'exists' do
    attributes = {}
    gym = Gym.new(attributes)

    expect(gym).to be_a Gym
  end

  it 'had attributes' do
    attributes = {  
      name: 'Academia 1',
      open_hour: '09:00',
      close_hour: '22:00',
      working_days: 'segunda á sexta',
      address: "Av Paulista 111",
      images: "https://example.com/image"
    }

    gym = Gym.new(attributes)
  
    expect(gym.name).to eq 'Academia 1'
    expect(gym.open_hour).to eq '09:00'
    expect(gym.close_hour).to eq '22:00'
    expect(gym.working_days).to eq 'segunda á sexta'
    expect(gym.address).to eq 'Av Paulista 111'
    expect(gym.images).to eq 'https://example.com/image'
  end

  context '.all' do
    it 'loads all gyms' do 
      json_response = [{:id=>1, :created_at=>"2019-10-16T23:09:34.572Z", :updated_at=>"2019-10-16T23:09:37.395Z", :name=>"Academia Paulista", :cod=>1, :open_hour=>"08:00", :close_hour=>"22:00", :working_days=>"segunda à sexta", :address=>"Av. Paulista, 123"}, {:id=>2, :created_at=>"2019-10-16T23:09:36.179Z", :updated_at=>"2019-10-16T23:09:38.196Z", :name=>"Academia Consolação", :cod=>2, :open_hour=>"08:00", :close_hour=>"22:00", :working_days=>"segunda à sexta", :address=>"Av. Consolação, 123"}, {:id=>3, :created_at=>"2019-10-16T23:09:36.217Z", :updated_at=>"2019-10-16T23:09:38.292Z", :name=>"Academia Madalena", :cod=>3, :open_hour=>"08:00", :close_hour=>"22:00", :working_days=>"segunda à sexta", :address=>"Av. Madalena, 123"}]

      stub_request(:get, "http://esperto_fit_academy-master_web_1:4000/api/v1/gyms").
      with(
        headers: {
        'Accept'=>'*/*',
        'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type'=>'application/json',
        'Password'=>'eyJhbGciOiJIUzI1NiJ9.IidFc3BlcnRvRml0R3ltJyI.u6afO6F22Hbx32vL2uefWXI1rEj_iYIFUHdeG22sRD0',
        'User-Agent'=>'Faraday v0.17.0'
        }).
      to_return(status: 200, body: json_response, headers: {})

      gyms = described_class.all
      gym_objects = json_response.map { |gym| described_class.new(gym) }
      
      expect(gyms).to be_instance_of(Array)
      expect(gyms).to match_array(gym_objects)
    end
  end
end