require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  let(:user) { FactoryGirl.create(:user) }
  let(:book) { FactoryGirl.create(:book) }

  before :each do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status :success
    end
    it 'renders "index" template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, id: book
      expect(response).to have_http_status :success
    end
    it 'renders "show" template' do
      get :show, id: book
      expect(response).to render_template 'show'
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, id: book
      expect(response).to have_http_status :success
    end
    it 'renders "edit" template' do
      get :edit, id: book
      expect(response).to render_template 'edit'
    end
  end

  describe 'GET #new' do 
    it 'returns http success' do
      get :new
      expect(response).to have_http_status :success
    end
    it 'renders "new" template' do
      get :new
      expect(response).to render_template 'new'
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates new book' do
        expect {
          post :create, book: FactoryGirl.attributes_for(:book)
        }.to change(Book, :count).by(1)
        expect(response).to redirect_to Book.last
      end

      it 'redirects to #show' do
        post :create, book: FactoryGirl.attributes_for(:book)
        expect(response).to redirect_to Book.last
      end
    end

    context 'with invalid attributes' do
      it 'does not create new book' do
        expect {
          post :create, book: FactoryGirl.attributes_for(:book, title: nil)
        }.to_not change(Book, :count)
      end
      it 'renders "new" template' do
        post :create, book: FactoryGirl.attributes_for(:book, title: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'when book exists' do
      it 'updates book' do
        patch :update, book: FactoryGirl.attributes_for(:book), id: book.id
        expect(response).to redirect_to book_path(book.id)
      end
    end
    context 'when gets invalid values' do
      it 'fails to update' do
        patch :update, book: FactoryGirl.attributes_for(:book, title: nil), id: book.id
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when book exists' do
      it 'deletes book' do
        expect {
          delete :destroy, id: book.id
        }.to_not change(Book, :count)
      end
      it 'redirects to #index' do
        delete :destroy, id: book.id
        expect(response).to redirect_to books_path
      end
    end

    context 'when book does not exist' do
      it 'fails to delete' do
        expect {
          delete :destroy, id: -1
        }.to raise_exception ActiveRecord::RecordNotFound
      end
    end
  end
end
