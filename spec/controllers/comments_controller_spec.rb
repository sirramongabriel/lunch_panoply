require 'spec_helper'

describe CommentsController do
  let(:comment)  { create :comment }

  describe 'GET #index' do
    before(:each) { get :index, employee_id: comment.employee_id }
    it 'returns http success and renders the :index template' do
      expect(response).to be_success
      expect(response).to render_template(:index)
    end

    it 'populates an array of comments' do
      comments = []
      comment1 = create :comment
      comments << comment1
      expect(comments).to eq [comment1]
    end
  end

  describe 'GET #new' do
    before(:each) { get :new, employee_id: comment.employee_id, id: comment.id }
    it 'returns http success and renders the :new template' do
      expect(response).to be_success
      expect(response).to render_template(:new)
    end

    it 'assigns a new Comment to comment' do
      expect(assigns(:comment)).to be_a_new(Comment)
    end
  end

  describe 'POST #create' do
    before(:each) {
                    post :create, 
                    employee_id: comment.employee_id, 
                    id: comment.id, 
                    comment: attributes_for(:comment)
                  }
    context 'given valid credentials' do
      it 'redirects to the :show template' do
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
    before(:each) { get :show, employee_id: comment.employee_id, id: comment.id }

    it 'returns http success and renders the :show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    before(:each) { get :edit, employee_id: comment.employee_id, id: comment.id }

    it 'returns http success and renders the :edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    before(:each) { put :update, 
                    employee_id: comment.employee_id, 
                    id: comment.id,
                    comment: attributes_for(:comment)
                  }

    context 'with valid attributes' do
      it 'locates the requested comment' do
        expect(assigns(:comment)).to eq comment
      end

      it 'changes the comment attributes' do
        put :update, employee_id: comment.employee_id, id: comment.id,
        comment: attributes_for(:comment, title: 'Here I am', content: 'testing testing')
        comment.reload
        expect(comment.title).to eq 'Here I am'
        expect(comment.content).to eq 'testing testing'
      end

      it 'redirects to the updated comment' do 
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
