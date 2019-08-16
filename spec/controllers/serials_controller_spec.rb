require 'rails_helper'

RSpec.describe SerialsController, type: :controller do
  before(:all) do
    @serial = create(:serial, title: 'Serial title 2')
  end

  # GET

  describe 'get #index' do
    it 'populates an array of serials.' do
      get :index
      assigns(:serials).should eq([@serial])
    end
    it 'renders the :index view.' do
      get :index
      response.should render_template :index
    end
  end

  describe 'get #show' do
    it 'renders :show view.' do
      get :show, params: { id: @serial }
      response.should render_template :show
    end
  end

  describe 'get #new' do
    it 'assigns a new Serial to @serial' do
      get :new
      expect(assigns(:serial)).to be_a_new(Serial)
    end
    it 'renders :new template' do
      get :new
      response.should render_template :new
    end
  end

  # POST

  describe 'post #create' do
    context 'with valid attributes' do
      it 'saves new serial in the database.' do
        expect {
          post :create, params: { serial: FactoryBot.attributes_for(:serial, title: 'Serial title 3', country_id: 1) }
        }.to change(Serial, :count).by(1)
      end
      it 'redirects to the serial show page.' do
        post :create, params: { serial: FactoryBot.attributes_for(:serial, title: 'Serial title 3', country_id: 1) }
        response.should redirect_to Serial.last
      end
    end

    context 'with invalid attributes' do
      it 'does not save new serial in the database.' do
        expect {
          post :create, params: { serial: FactoryBot.attributes_for(:invalid_serial) }
        }.not_to change(Serial, :count)
      end
      it 're-renders :new template.' do
        post :create, params: { serial: FactoryBot.attributes_for(:invalid_serial) }
        response.should render_template :new
      end
    end
  end

  # PUT

  describe 'put #update' do
    before :each do
      create(:country, id: 2, country_name: 'Brazil', shortcut: 'BR')
    end

    context 'with valid attributes' do
      it 'located the requested @serial.' do
        put :update, params: { id: @serial, serial: FactoryBot.attributes_for(:serial) }
        assigns(:serial).should eq(@serial)
      end

      it 'changes @serial attributes.' do
        put :update, params: { id: @serial, serial: FactoryBot.attributes_for(:serial, title: 'New serial title', country_id: 2) }
        @serial.reload
        @serial.title.should eq('New serial title')
        @serial.country_id.should eq(2)
      end

      it 'redirects to the updated serial.' do
        put :update, params: { id: @serial, serial: FactoryBot.attributes_for(:serial, title: 'New serial title', country_id: 2) }
        response.should redirect_to @serial
      end
    end

    context 'with invalid attributes' do
      it 'located the requested @serial.' do
        put :update, params: { id: @serial, serial: FactoryBot.attributes_for(:serial) }
        assigns(:serial).should eq(@serial)
      end

      it 'does not chang @serial attributes.' do
        put :update, params: { id: @serial, serial: FactoryBot.attributes_for(:invalid_serial) }
        @serial.reload
        @serial.title.should eq('Serial title 2')
      end

      it 're-renders :edit template.' do
        put :update, params: { id: @serial, serial: FactoryBot.attributes_for(:invalid_serial) }
        response.should render_template :edit
      end
    end
  end

  # DELETE

  describe '#delete' do
    it 'deletes serial and redirects to #index.' do
      expect {
        delete :destroy, params: { id: @serial }
      }.to change(Serial, :count).by(-1)
      response.should redirect_to serials_path
    end
  end
end
