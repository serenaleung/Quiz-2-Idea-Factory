require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  let(:user) { FactoryGirl.create(:user) }

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
    context "vaild parameters" do
      before { request.session[:user_id] = user.id }

      def valid_request
        post :create, params: { idea: FactoryGirl.attributes_for(:idea)  }
      end

      it "redirects to the home page" do
        valid_request
        expect(response).to redirect_to(idea_path(Idea.last))
      end

      it "signs the user in" do
        valid_request
        expect(session[:user_id]).to eq(user.id)
      end

      it 'associates the idea to the signed in user' do
        valid_request
        expect(Idea.last.user).to eq(user)
      end

      it "sets a flash message" do
        valid_request
        expect(flash[:notice]).to be
      end
    end

    context "invaild parameters" do
      before { request.session[:user_id] = user.id }

      def invalid_request
        post :create, params: { idea: FactoryGirl.attributes_for(:idea, title: nil)  }
      end

      it "redirects to the home page" do
        invalid_request
        expect(response).to render_template(:new)
      end

      it "sets a flash message" do
        invalid_request
        expect(flash[:alert]).to be
      end
    end
  end
end
