require 'rails_helper'

RSpec.describe Api::V1::PointsOfInterestController, type: :controller do
  describe "POST #create" do
    before :each do
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    context "register point of interest" do
      it "must have success status with allowed attributes" do
        post :create, params: {
           point_of_interest: {
              name: 'Restaurant', x: 10, y: 25
           }
        }

        expect(response).to be_success
        expect(response).to have_http_status(201)
      end

      it "mustn't have success status with attributes x negative" do
        post :create, params: {
           point_of_interest: {
              name: 'Restaurant', x: -10, y: 25
           }
        }

        expect(response).not_to be_success
        expect(response).to have_http_status(422)
      end

      it "mustn't have success status without attributes name" do
        post :create, params: {
           point_of_interest: {
              name: '', x: -10, y: 25
           }
        }

        expect(response).not_to be_success
        expect(response).to have_http_status(422)
      end

      it "mustn't have success status with attributes y negative" do
        post :create, params: {
           point_of_interest: {
              name: '', x: 10, y: -25
           }
        }

        expect(response).not_to be_success
        expect(response).to have_http_status(422)
      end

      it "mustn't have success status with invalid attributes params" do
        post :create, params: {
           point_of_interest: {
              nameeeeeee: 'Restaurant', x_x: 10, y: 25
           }
        }

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
        @point_of_interest_1 = create(:point_of_interest, x: 20, y: 10)
        @point_of_interest_2 = create(:point_of_interest, x: 10, y: 20)
        @point_of_interest_3 = create(:point_of_interest, x: 50, y: 50)
        @point_of_interest_4 = create(:point_of_interest, x: 5, y: 30)
        @point_of_interest_5 = create(:point_of_interest, x: 100, y: 2)
        @point_of_interest_5 = create(:point_of_interest, x: 20, y: 20)
      end

      it "must return 3 points of interest" do
        get :get_by_proximity, params: {
          point_of_interest: {
            x: 20, y: 10, d_max: 10
          }
        }

        expect(JSON.parse(response.body).count).to eql(3)
      end

      it "mustn't return points of interest" do
        get :get_by_proximity, params: {
          point_of_interest: {
            x: 1000, y: 1000, d_max: 20
          }
        }

        expect(JSON.parse(response.body).count).to eql(0)
      end

      it "must return 1 point of interest" do
        get :get_by_proximity, params: {
          point_of_interest: {
            x: 40, y: 40, d_max: 10
          }
        }

        expect(JSON.parse(response.body).count).to eql(1)
      end

      it "must return 1 point of interest" do
        get :get_by_proximity, params: {
          point_of_interest: {
            x: 99, y: 1, d_max: 1
          }
        }

        expect(JSON.parse(response.body).count).to eql(1)
      end

      it "must return 1 point of interest" do
        get :get_by_proximity, params: {
          point_of_interest: {
            x: 30, y: 30, d_max: 20
          }
        }

        expect(JSON.parse(response.body).count).to eql(1)
      end
    end

  end

end
