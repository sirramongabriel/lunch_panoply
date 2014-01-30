require 'spec_helper'

describe CommentsController do
  let(:comment)  { create :comment }

  describe 'GET #index' do
    it 'returns http success and renders the :index template' do
      get :index, employee_id: comment.employee_id, id: comment.id
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'populates an array of comments' do
      comments = []
      comment1 = create :comment
      comments << comment1
      get :index, employee_id: comment1.employee_id
      expect(comments).to eq [comment1]
    end
  end

  describe 'GET #new' do
    it 'returns http success and renders the :new template' do
      get :new, employee_id: comment.employee_id, id: comment.id
      expect(response).to be_success
      expect(response).to render_template(:new)
    end

    it 'assigns a new Comment to comment' do
      get :new, employee_id: comment.employee_id, id: comment.id
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe 'POST #create' do
    context 'given valid credentials' do
      it 'returns http success and redirects to the :show template' do
        post :create, employee_id: comment.employee_id, id: comment.id,
        comment: attributes_for(:comment)
        comment = Comment.order(:created_at).last
        expect(response).to be_redirect
      end

      it 'saves the new comment in the database' do
        expect {
                  post :create, 
                  comment: attributes_for(:comment, 
                                          employee_id: comment.employee_id, 
                                          id: comment.id).to 
                  change(Comment, :count).by(1)
               }
      end
    end

    context 'given invalid credentials' do
      it 'returns http client error' do
        post :create, attributes_for(:comment), 
        employee_id: comment.employee_id, id: comment.id
        comment = Comment.order(:created_at).last
        comment.title = nil
        expect(comment).to have(1).error_on(:title)
      end

      it 'renders the :new template' do
        post :create, employee_id: comment.employee_id, id: comment.id
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #show' do
    it 'returns http success and renders the :show tempalte' do
      get :show, employee_id: comment.employee_id, id: comment.id
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'returns http success and renders the :edit template' do
      get :edit, employee_id: comment.employee_id, id: comment.id
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'locates the requested comment' do
        put :update, employee_id: comment.employee_id, id: comment.id,
        comment: attributes_for(:comment)
        expect(assigns(:comment)).to eq comment
      end

      it 'changes the comment attributes' do
        put :update, employee_id: comment.employee_id, id: comment.id,
        comment: attributes_for(:comment, title: 'Here I am', content: 'testing testing')
        comment.reload
        expect(comment.title).to eq 'Here I am'
        expect(comment.content).to eq 'testing testing'
      end

      it 'redirects to the updated contact' do 
        put :update, employee_id: comment.employee, id: comment.id,
        comment: attributes_for(:comment)
        expect(response).to redirect_to employee_comment_path
      end
    end

    context 'with invalid attributes' do
      it 'does not change the employee attributes' do
        put :update, employee_id: comment.employee_id, id: comment.id,
        comment: attributes_for(:comment, title: 'The first title', content: nil)
        comment.reload
        expect(comment.title).not_to eq 'The first title'
        expect(comment.content).not_to eq nil
      end

      it 're-renders the :edit template' do
        put :update, employee_id: comment.employee_id, id: comment.id,
        comment: attributes_for(:invalid_comment)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes a comment from the database' do
      comment = create :comment
      expect {
                delete :destroy, employee_id: comment.employee_id, id: comment.id
             }.to change(Comment, :count).by(-1)
    end

    it 'successfully redirects to the Comment :index template' do
      delete :destroy, employee_id: comment.employee_id, id: comment.id
      expect(response).to redirect_to employee_comments_path
    end
  end
end
