require 'rails_helper'

RSpec.describe Api::V1::PointsOfInterestController, type: :controller do
  describe "POST #create" do
    before :each do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "register point of interest" do
      it "must have success status with allowed attributes" do
        post :create, params: { name: 'Restaurant', x: 10, y: 25 }

        expect(response).to be_success
        expect(response).to have_http_status(201)
      end

      it "mustn't have success status with attributes x negative" do
        post :create, params: { name: 'Restaurant', x: -10, y: 25 }

        expect(response).not_to be_success
        expect(response).to have_http_status(422)
      end

      it "mustn't have success status without attributes name" do
        post :create, params: { name: '', x: -10, y: 25 }

        expect(response).not_to be_success
        expect(response).to have_http_status(422)
      end

      it "mustn't have success status with attributes y negative" do
        post :create, params: { name: '', x: 10, y: -25 }

        expect(response).not_to be_success
        expect(response).to have_http_status(422)
      end

      it "mustn't have success status with invalid attributes params" do
        post :create, params: { nameeeeeee: 'Restaurant', x_x: 10, y: 25 }

        expect(response).not_to be_success
        expect(response).to have_http_status(422)
      end
    end

  end


  describe "GET #get_by_proximity" do

    before :each do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "listing all point of interest" do
      before do
        @point_of_interest_1 = create(:point_of_interest, name: 'Lanchonete', x: 27, y: 12)
        @point_of_interest_2 = create(:point_of_interest, name: 'Posto', x: 31, y: 18)
        @point_of_interest_3 = create(:point_of_interest, name: 'Joalheria', x: 15, y: 12)
        @point_of_interest_4 = create(:point_of_interest, name: 'Floricultura', x: 19, y: 21)
        @point_of_interest_5 = create(:point_of_interest, name: 'Pub', x: 12, y: 8)
        @point_of_interest_6 = create(:point_of_interest, name: 'Supermercado', x: 23, y: 6)
        @point_of_interest_7 = create(:point_of_interest, name: 'Churras', x: 28, y: 2)
      end

      it "must return 4 points of interest" do
        get :get_by_proximity, params: { x: 20, y: 10, d_max: 10 }

        expect(JSON.parse(response.body).count).to eql(4)
      end
    end

  end

end
