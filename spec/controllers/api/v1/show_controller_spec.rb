require 'rails_helper'
RSpec.describe Api::V1::RidesController, type: :controller do

  let!(:ride_1) { Ride.create(
    name: "Under the Sea ~ Journey of The Little Mermaid", 
    location: "Fantasyland", 
    image_url: "https://cdn1.parksmedia.wdprapps.disney.com/resize/mwImage/1/630/354/75/dam/wdpro-assets/parks-and-tickets/attractions/magic-kingdom/under-the-sea-journey-of-the-little-mermaid/under-the-sea-journey-of-the-little-mermaid-new-00.jpg",
    description: "Revisit the classic “tail” of how one lucky little mermaid found true love… and legs." 
    ) }

    let!(:user_1) { User.create(
      email: "user1@gmail.com",
      password: "user1password", 
      username: "user1"
      ) }
    let!(:review_1) { Review.create(
      title: 'Fun kids’ ride',
      body: 'Emerge from the ocean’s depths in time to celebrate Ariel’s happily ever after in a spectacular fairytale finale.',
      rating: 5,
      user: user_1,
      ride: ride_1 
    )}

  describe "GET#show" do
    it "should return show page for rides and review for the user" do
      get :show, params: { id: ride_1.to_param }
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json['ride']['name']).to eq(ride_1['name'])
      expect(returned_json['ride']['location']).to eq(ride_1['location'])
      expect(returned_json['ride']['image_url']).to eq(ride_1['image_url'])
      expect(returned_json['ride']['description']).to eq(ride_1['description'])

      expect(returned_json['ride']['reviews'][0]['title']).to eq(review_1['title'])
      expect(returned_json['ride']['reviews'][0]['body']).to eq(review_1['body'])
      expect(returned_json['ride']['reviews'][0]['rating']).to eq(review_1['rating'])

      expect(returned_json['ride']['reviews'][0]['user']['email']).to eq(user_1['email'])
      expect(returned_json['ride']['reviews'][0]['user']['username']).to eq(user_1['username'])
    end
  end
end
