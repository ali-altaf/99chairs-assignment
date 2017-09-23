require 'rails_helper'

RSpec.describe NameController, type: :controller do
  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "Create via csv" do
    it "it creates name model via help of API" do
      post :create, { :csv => "id,first_name,last_name
                                1,Ali,Altaf" }
      expect(response.content_type).to eq "text/html"
    end
  end
end
