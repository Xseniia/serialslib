require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) do
    @user = create(:user)
  end

  # GET

  # describe 'get #index' do
  #   it 'populates an array of users.' do
  #     get :index
  #     assigns(:users).should eq([@user])
  #   end
  #   it 'renders the :index view.' do
  #     get :index
  #     response.should render_template :index
  #   end
  # end
  #
  # describe 'get #show' do
  #   it 'renders :show view.' do
  #     get :show, params: { id: @user }
  #     response.should render_template :show
  #   end
  # end
  #
  # describe 'get #new' do
  #   it 'assigns a new User to @user' do
  #     get :new
  #     expect(assigns(:user)).to be_a_new(User)
  #   end
  #   it 'renders :new template' do
  #     get :new
  #     response.should render_template :new
  #   end
  # end
  #
  # # POST
  #
  # describe 'post #create' do
  #   context 'with valid attributes' do
  #     it 'saves new user in the database.' do
  #       expect {
  #         post :create, params: { user: FactoryBot.attributes_for(:user) }
  #       }.to change(User, :count).by(1)
  #     end
  #     it 'redirects to the home page.' do
  #       post :create, params: { user: FactoryBot.attributes_for(:user) }
  #       response.should redirect_to root_path
  #     end
  #   end
  #
  #   context 'with invalid attributes' do
  #     it 'does not save new user in the database.' do
  #       expect {
  #         post :create, params: { user: FactoryBot.attributes_for(:user, email: nil) }
  #       }.not_to change(User, :count)
  #     end
  #     it 're-renders :new template.' do
  #       post :create, params: { user: FactoryBot.attributes_for(:user, email: nil) }
  #       response.should render_template :new
  #     end
  #   end
  # end
  #
  # # PUT
  #
  # describe 'put #update' do
  #   context 'with valid attributes' do
  #     it 'located the requested @user.' do
  #       put :update, params: { id: @user, user: FactoryBot.attributes_for(:user) }
  #       assigns(:user).should eq(@user)
  #     end
  #
  #     it 'changes @user attributes.' do
  #       put :update, params: { id: @user, user: FactoryBot.attributes_for(:user, email: 'mynewemail@email.com') }
  #       @user.reload
  #       @user.email.should eq('mynewemail@email.com')
  #     end
  #
  #     it 'redirects to the updated user.' do
  #       put :update, params: { id: @user, user: FactoryBot.attributes_for(:user, email: 'mynewemail@email.com') }
  #       response.should redirect_to @user
  #     end
  #   end
  #
  #   context 'with invalid attributes' do
  #     it 'located the requested @user.' do
  #       put :update, params: { id: @user, user: FactoryBot.attributes_for(:user, email: 'incorrect') }
  #       assigns(:user).should eq(@user)
  #     end
  #
  #     it 'does not chang @user attributes.' do
  #       put :update, params: { id: @user, user: FactoryBot.attributes_for(:user, email: 'incorrect') }
  #       @user.reload
  #       @user.email.should_not eq('incorrect')
  #     end
  #
  #     it 're-renders :edit template.' do
  #       put :update, params: { id: @user, user: FactoryBot.attributes_for(:user, email: 'incorrect') }
  #       response.should render_template :edit
  #     end
  #   end
  # end
  #
  # # DELETE
  #
  # describe '#delete' do
  #   it 'deletes user and redirects to #index.' do
  #     expect {
  #       delete :destroy, params: { id: @user }
  #     }.to change(User, :count).by(-1)
  #     response.should redirect_to index
  #   end
  # end
end
