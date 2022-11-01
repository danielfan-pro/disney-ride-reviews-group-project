require 'rails_helper'

RSpec.describe Api::V1::RidesController, type: :controller do

  let!(:ride_1) { Ride.create(name: "Big Thunder Mountain Railroad" , location: "Frontierland" ) }

  describe "GET#index" do
    it "should return the name and location of the ride" do
      get :index

      # save_and_open_page
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json[0]['name']).to eq(ride_1['name'])
      expect(returned_json[0]['location']).to eq(ride_1['location'])

    end
  end


end

