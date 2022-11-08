require 'rails_helper'

RSpec.describe Api::V1::RidesController, type: :controller do

  let!(:ride_1) { Ride.create(
    name: "Under the Sea ~ Journey of The Little Mermaid", 
    location: "Fantasyland", 
    image_url: "https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/630/354/75/dam/wdpro-assets/parks-and-tickets/attractions/magic-kingdom/under-the-sea-journey-of-the-little-mermaid/under-the-sea-journey-of-the-little-mermaid-new-00.jpg",
    description: "Revisit the classic “tail” of how one lucky little mermaid found true love… and legs." 
    ) 
  }

  describe "GET#create" do
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
    it "creates a new ride when required data is provided and admin is logged in" do
      post_json = {
        ride: {
          name: "Astro Orbiter",
          location: "Tomorrowland",
          image_url: "https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/250/127/75/dam/wdpro-assets/parks-and-tickets/attractions/magic-kingdom/astro-orbiter/astro-orbiter-00.jpg?1658974212951",
          description: "Pilot a spaceship high in the sky amid a gleaming constellation of planets."
        }
      }

      user_admin = User.create(
        email: "admin1@gmail.com",
        password: "adminpassword",
        username: "admin",
        role: "admin"
      )

      sign_in user_admin
      

      previous_count = Ride.count
      post(:create, params: post_json, format: :json)
      
      returned_json = JSON.parse(response.body)["ride"]
      
     
      expect(Ride.count).to eq(previous_count +1)

      expect(response.status).to eq(200)
      expect(response.content_type).to eq("application/json")

      expect(returned_json["name"]).to eq("Astro Orbiter")
      expect(returned_json["location"]).to eq("Tomorrowland")
      expect(returned_json["image_url"]).to eq("https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/250/127/75/dam/wdpro-assets/parks-and-tickets/attractions/magic-kingdom/astro-orbiter/astro-orbiter-00.jpg?1658974212951")
      expect(returned_json["description"]).to eq("Pilot a spaceship high in the sky amid a gleaming constellation of planets.")
    end

    it "doesn't create a new ride when required data is improperly submitted" do
      post_json = {
        ride: {
          name: "Astro Orbiter",
          location: "",
          image_url: "https://disney.com",
          description: ""
        }
      }

      user_admin2 = User.create(
        email: "admin1@gmail.com",
        password: "adminpassword",
        username: "admin",
        role: "admin"
      )

      sign_in user_admin2

      previous_count = Ride.count
      post(:create, params: post_json, format: :json)
      
      returned_json = JSON.parse(response.body)["ride"]

      expect(Ride.count).to eq(previous_count)

      expect(response.status).to eq(401)
      expect(response.content_type).to eq("application/json")
    end
  end

end

