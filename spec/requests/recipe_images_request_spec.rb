require 'rails_helper'

RSpec.describe "RecipeImages", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/recipe_images/create"
      expect(response).to have_http_status(:success)
    end
  end

end
