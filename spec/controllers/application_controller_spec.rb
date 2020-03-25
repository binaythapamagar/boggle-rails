require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

    describe "GET #gameboard" do
        before do
            get :gameboard
        end
        it "returns http success" do
            expect(response).to have_http_status(:success)
        end
        it "JSON body response contains array object of length 4 with each being kind of string and also length 4" do
            json_response = JSON.parse(response.body)
            expect(json_response.length).to equal(4)
            for i in 0..3
                expect(json_response[i]).to include(a_kind_of(String))
                expect(json_response[i].length).to equal(4)    
             end
        end    
    end

    # describe "POST #validateword" ,:type => :request do
    #     before do
    #         params = {word: "hair"}
    #         headers = { "CONTENT_TYPE" => "application/json" }
    #         post "/validate-word", :body => '{ "widget": { "name":"My Widget" } }', :headers => headers
    
    #         # post "/validate-word", params: params.to_json,headers: headers
    #     end
    #     it "returns http success" do
    #         expect(response).to have_http_status(:success)
    #     end
           
    # end
end
