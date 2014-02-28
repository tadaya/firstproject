require "spec_helper"

describe "user lands on splash page with trending locations" do
  let(:user) { FactoryGirl.create(:user) }
  let(:place) { Place.create(name: "General Assembly West", lat: "40.739934", long: "-73.990082", map_url: "http://maps.googleapis.com/maps/api/staticmap?center=40.739934,-73.990082&zoom=15&size=400x400&sensor=false") }
  100.times { FactoryGirl.create(:tagging, place: :place, user: :user) }


  it "lands on splash page" do
    visit root_path
    expect(page).to have_content place.name
  end

end