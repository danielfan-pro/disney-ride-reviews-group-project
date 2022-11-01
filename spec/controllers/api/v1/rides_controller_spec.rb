require 'rails_helper'

RSpec.describe Api::V1::RidesController, type: :controller do

  let!(:ride_1) { Ride.create(
    name: "Under the Sea ~ Journey of The Little Mermaid", 
    location: "Fantasyland", 
    image_url: "https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/630/354/75/dam/wdpro-assets/parks-and-tickets/attractions/magic-kingdom/under-the-sea-journey-of-the-little-mermaid/under-the-sea-journey-of-the-little-mermaid-new-00.jpg",
    description: "Revisit the classic “tail” of how one lucky little mermaid found true love… and legs." 
    ) }

  describe "GET#index" do
    it "should return the name and location of the ride" do
      get :index

      # save_and_open_page
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json[0]['name']).to eq(ride_1['name'])
      expect(returned_json[0]['location']).to eq(ride_1['location'])
      expect(returned_json[0]['image_url']).to eq(ride_1['image_url'])
      expect(returned_json[0]['description']).to eq(ride_1['description'])

    end
  end


end

