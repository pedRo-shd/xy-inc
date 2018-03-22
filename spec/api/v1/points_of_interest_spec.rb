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

end
