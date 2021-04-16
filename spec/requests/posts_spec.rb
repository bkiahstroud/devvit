# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/posts', type: :request, clean: true do
  let(:subdevvit) { FactoryBot.create(:subdevvit) }
  let(:valid_attributes) do
    {
      title: 'Test Post',
      subdevvit_id: subdevvit.id
    }
  end
  let(:invalid_attributes) do
    {
      title: '',
      subdevvit_id: nil
    }
  end

  describe 'GET /index' do
    let!(:post_1) { FactoryBot.create(:post) }
    let!(:post_2) { FactoryBot.create(:post) }
    let!(:post_3) { FactoryBot.create(:post) }

    it 'renders a successful response' do
      get posts_url
      expect(response).to be_successful
    end

    it 'lists all posts' do
      get posts_url

      expect(response.body).to include(post_1.title)
      expect(response.body).to include(post_2.title)
      expect(response.body).to include(post_3.title)
    end
  end

  describe 'GET /show' do
    let!(:post) { FactoryBot.create(:post) }

    it 'renders a successful response' do
      get post_url(post)
      expect(response).to be_successful
    end

    it 'shows a single post' do
      get post_url(post)

      expect(response.body).to include(post.title)
      expect(response.body).to include(post.text)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_post_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:post) { FactoryBot.create(:post) }

    it 'render a successful response' do
      get edit_post_url(post)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Post' do
        expect do
          post posts_url, params: { post: valid_attributes }
        end.to change(Post, :count).by(1)
      end

      it 'redirects to the created post' do
        post posts_url, params: { post: valid_attributes }
        expect(response).to redirect_to(post_url(Post.last))

        follow_redirect!

        expect(response.body).to include(valid_attributes[:title])
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Post' do
        expect do
          post posts_url, params: { post: invalid_attributes }
        end.to change(Post, :count).by(0)
      end

      it 'renders an Unprocessable Entity response' do
        post posts_url, params: { post: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    let!(:post) { FactoryBot.create(:post) }

    context 'with valid parameters' do
      let(:new_attributes) do
        {
          title: 'New Post',
          subdevvit_id: subdevvit.id
        }
      end

      it 'updates the requested post' do
        expect { patch post_url(post), params: { post: new_attributes } }
          .to change { post.reload.title }.to(new_attributes[:title])
      end

      it 'redirects to the post' do
        patch post_url(post), params: { post: new_attributes }
        post.reload
        expect(response).to redirect_to(post_url(post))
      end
    end

    context 'with invalid parameters' do
      it 'renders an Unprocessable Entity response' do
        patch post_url(post), params: { post: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:post) { FactoryBot.create(:post) }

    it 'destroys the requested post' do
      expect do
        delete post_url(post)
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      delete post_url(post)
      expect(response).to redirect_to(posts_url)
    end
  end
end
