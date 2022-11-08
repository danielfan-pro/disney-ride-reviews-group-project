require 'rails_helper'

RSpec.describe Api::V1::RidesController, type: :controller do

  let!(:ride_9) { Ride.create(
    name: "Astro Orbiter", 
    location: "Tomorrowland", 
    image_url: "https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/630/354/75/dam/wdpro-assets/parks-and-tickets/attractions/magic-kingdom/under-the-sea-journey-of-the-little-mermaid/under-the-sea-journey-of-the-little-mermaid-new-00.jpg",
    description: "Pilot a spaceship high in the sky amid a gleaming constellation of planets" 
    ) }

  describe "GET#api/v1/rides#create" do
    it "should return the name, location, and description of the newly added ride" do
      get :create

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json['rides/10'][0]['name']).to eq(ride_9['name'])
      expect(returned_json['rides/10'][0]['location']).to eq(ride_9['location'])
      expect(returned_json['rides/10'][0]['image_url']).to eq(ride_9['image_url'])
      expect(returned_json['rides/10'][0]['description']).to eq(ride_9['description'])

    end
  end

end

