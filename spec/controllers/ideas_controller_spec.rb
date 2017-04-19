require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }
  # is equivalent to:
  # def user
  #   @user ||= FactoryGirl.create(:user)
  # end

  # by adding `user: user` we make the idea associated with the user `user`
  # which is defined the the `let` above
  let(:idea) { FactoryGirl.create(:idea, { user: user }) }
  let(:idea1) { FactoryGirl.create(:idea) } #not specified user so will create a brand new user

  describe '#new' do
    context 'with no user signed in' do
      it 'redirects the user to the home page' do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end

    context 'with user signed in' do
      before { request.session[:user_id] = user.id }
      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
      it 'assigns a new Idea instance variable' do
      get :new
      expect(assigns(:idea)).to be_a_new(Idea)
    end
    end
  end

  describe "#create" do
    before { request.session[:user_id] = user.id }
      context "vaild parameters" do
        def valid_request
          post :create, params: { user: FactoryGirl.attributes_for(:user), idea: FactoryGirl.attributes_for(:idea)  }
        end
        it "redirects to the home page" do
          valid_request
          expect(response).to redirect_to(idea_path(Idea.last))
        end
        it "signs the user in" do
          valid_request
          user = User.last
          expect(session[:user_id]).to eq(user.id)
        end
        it "sets a flash message" do
          valid_request
          expect(flash[:notice]).to be
        end
      end
    end
end
