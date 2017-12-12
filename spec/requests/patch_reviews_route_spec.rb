require 'rails_helper'

describe "patch a destination review route", :type => :request do
  let!(:destination) { @d = FactoryBot.create :destination }

  before do
    @y = Review.create!(:destination_id => @d.id, :author => 'Keegan', :content => 'blah blah blah', :rating => 1)

    patch "/destinations/#{@d.id}/reviews/#{@y.id}", params: {:author => "Barney"}
  end

  it 'updates the destination reviews author' do
    expect(JSON.parse(response.body)['message']).to eq("Your Review has been successfully updated.")
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:ok)
  end
end
