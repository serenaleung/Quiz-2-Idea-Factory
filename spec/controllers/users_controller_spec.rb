require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#create" do
    before { request.session[:user_id] = user.id }
    context "vaild parameters" do

      it "creates a user in the database" do
        count_before = User.count
        valid_request
        count_after = User.count
        expect(count_after).to eq(count_before+1)
        
      end
    end
  end

end
