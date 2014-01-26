require 'spec_helper'

describe CommentsController do
  let(:comment) { create(:comment) }
  describe 'GET #index' do
    it 'returns http success' do
      get :index, employee_id: comment.employee_id
      response.should be_success
    end

    it 'populates an array of comments' do
      comments = []
      comment1 = create :comment
      comment2 = create :comment
      comment3 = create :comment
      comments << comment1 << comment2 << comment3
      get :index, employee_id: comment.employee_id, id: comment.id
      expect(comments).to eq [comment1, comment2, comment3]
    end

    it 'renders the :index template' do
      get :index, employee_id: comment.employee_id, id: comment.id
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new, employee_id: comment.employee_id, id: comment.id
      response.should be_success
    end

    it 'assigns a new Comment to @comment' do
      get :new, employee_id: comment.employee_id, id: comment.id
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it 'renders the :new teplate' do
      get :new, employee_id: comment.employee_id, id: comment.id
      expect(response).to render_template :new
    end
  end

  describe 'GET #create' do
    context 'given valid credentials' do
      it 'returns http success and redirects to the :show template' do
        get :create, FactoryGirl.attributes_for(:comment),
        employee_id: comment.employee_id, id: comment.id
        comment = Comment.order(:created_at).last
        expect(response).to be_redirect
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        get :create, FactoryGirl.attributes_for(:comment), 
        employee_id: comment.employee_id, id: comment.id
        comment = Comment.order(:created_at).last
        expect(response).not_to be_success
      end

      it 'renders the :new template' do
        post :create, employee_id: comment.employee_id, id: comment.id
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, employee_id: comment.employee_id, id: comment.id
      response.should be_success
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit, employee_id: comment.employee_id, id: comment.id
      expect(response).to be_success
    end

    it 'renders the :edit template' do
      get :edit, employee_id: comment.employee_id, id: comment.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'GET #update' do
    it 'returns http success' do
      get :update, employee_id: comment.employee_id, id: comment.id
      response.should be_success
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      get :destroy, employee_id: comment.employee_id, id: comment.id
      response.should be_success
    end
  end
end
