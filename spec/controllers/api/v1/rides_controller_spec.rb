require 'rails_helper'

RSpec.describe Api::V1::RidesController, type: :controller do

  let!(:user_admin) { User.create(
    email: "admin1@gmail.com",
    password: "adminpassword",
    username: "admin",
    role: "admin"
  )}

  let!(:ride_1) { Ride.create(
    name: "Journey of The Little Mermaid", 
    location: "Fantasyland", 
    image_url: "https://i.imgur.com/eAuaWBM.jpeg",
    description: "Revisit the classic “tail” of how one lucky little mermaid found true love… and legs." ,
    user: user_admin
    ) 
  }

  describe "GET#index" do
    it "should return the name and location of the ride" do
      get :index

      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json['rides'][0]['name']).to eq(ride_1['name'])
      expect(returned_json['rides'][0]['location']).to eq(ride_1['location'])
      expect(returned_json['rides'][0]['image_url']).to eq(ride_1['image_url'])
      expect(returned_json['rides'][0]['description']).to eq(ride_1['description'])

    end
  end

  describe "POST#create" do
    context "when a request correct params is made" do

     it "creates a new ride when required data is provided and admin is logged in" do

      correct_json = {
        ride: {
          name: "Astro Orbiter",
          location: "Tomorrowland",
          image_url: "https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/250/127/75/dam/wdpro-assets/parks-and-tickets/attractions/magic-kingdom/astro-orbiter/astro-orbiter-00.jpg?1658974212951",
          description: "Pilot a spaceship high in the sky amid a gleaming constellation of planets.",
          user: user_admin
        }
      }

      sign_in user_admin
 
      previous_count = Ride.count
      post(:create, params: correct_json, format: :json)
      
      returned_json = JSON.parse(response.body)["ride"]
     
      expect(Ride.count).to eq(previous_count +1)

      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      expect(returned_json["name"]).to eq("Astro Orbiter")
      expect(returned_json["location"]).to eq("Tomorrowland")
      expect(returned_json["image_url"]).to eq("https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/250/127/75/dam/wdpro-assets/parks-and-tickets/attractions/magic-kingdom/astro-orbiter/astro-orbiter-00.jpg?1658974212951")
      expect(returned_json["description"]).to eq("Pilot a spaceship high in the sky amid a gleaming constellation of planets.")
    end
  end

  context "when a malformed request is made"
    it "doesn't create a new ride when required data is improperly submitted" do
      bad_json = {
        ride: {
          name: "Astro Orbiter",
          location: "",
          image_url: "https://disney.com",
          description: ""
        }
      }

      sign_in user_admin

      previous_count = Ride.count
      post(:create, params: bad_json, format: :json)
      
      returned_json = JSON.parse(response.body)

      expect(Ride.count).to eq(previous_count)
      
      expect(returned_json["errors"]).to eq("Location can't be blank and Description can't be blank")
      expect(response.content_type).to eq("application/json")
    end
  end

end

