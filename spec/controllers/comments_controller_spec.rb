require 'spec_helper'

describe CommentsController do
  describe 'GET #index' do
    it 'returns http success' do
      comment = FactoryGirl.create :comment
      get :index, employee_id: comment.employee_id, id: comment.id
      response.should be_success
    end

    it 'populates an array of comments' do
      comments = []
      comment1 = create :comment
      comments << comment1
      get :index, employee_id: comment1.employee_id, id: comment1.id
      expect(comments).to eq [comment1]
    end

    it 'renders the :index template' do
      comment = create :comment
      get :index, employee_id: comment.employee_id, id: comment.id
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      comment = create :comment
      get :new, employee_id: comment.employee_id, id: comment.id
      expect(response).to be_success
    end

    it 'assigns a new Comment to @comment' do
      comment = create :comment
      get :new, employee_id: comment.employee_id, id: comment.id
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it 'renders the :new teplate' do
      comment = create :comment
      get :new, employee_id: comment.employee_id, id: comment.id
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'given valid credentials' do
      it 'returns http success' do
        comment = create :comment
        post :create, FactoryGirl.attributes_for(:comment),
        employee_id: comment.employee_id, id: comment.id
        comment = Comment.order(:created_at).last
        expect(response).to be_success
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        comment = create :comment
        get :create, FactoryGirl.attributes_for(:comment), 
        employee_id: comment.employee_id, id: comment.id
        comment = Comment.order(:created_at).last
        comment.title = nil
        expect(comment).to have(1).error_on(:title)
      end

      it 'renders the :new template' do
        comment = create :comment
        post :create, employee_id: comment.employee_id, id: comment.id
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      comment = create :comment
      get :show, employee_id: comment.employee_id, id: comment.id
      response.should be_success
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      comment = create :comment
      get :edit, employee_id: comment.employee_id, id: comment.id
      expect(response).to be_success
    end

    it 'renders the :edit template' do
      comment = create :comment
      get :edit, employee_id: comment.employee_id, id: comment.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    it 'returns http success' do
      comment = create :comment
      put :update, employee_id: comment.employee_id, id: comment.id
      response.should be_success
    end
  end

  describe 'GET #destroy' do
    it 'returns http success' do
      comment = create :comment
      get :destroy, employee_id: comment.employee_id, id: comment.id
      response.should be_success
    end
  end
end
