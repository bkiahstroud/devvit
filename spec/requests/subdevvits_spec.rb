# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/subdevvits', type: :request, clean: true do
  # Subdevvit. As you add validations to Subdevvit, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'test_subdevvit' }
  end
  let(:invalid_attributes) do
    { name: '' }
  end

  describe 'GET /index' do
    let!(:subdevvit_1) { FactoryBot.create(:subdevvit) }
    let!(:subdevvit_2) { FactoryBot.create(:subdevvit) }
    let!(:subdevvit_3) { FactoryBot.create(:subdevvit) }

    it 'renders a successful response' do
      get subdevvits_url
      expect(response).to be_successful
    end

    it 'lists all subdevvits' do
      get '/subdevvits'

      expect(response.body).to include(subdevvit_1.name)
      expect(response.body).to include(subdevvit_2.name)
      expect(response.body).to include(subdevvit_3.name)
    end
  end

  describe 'GET /show' do
    let(:subdevvit) { FactoryBot.create(:subdevvit) }
    let!(:post_1) { FactoryBot.create(:post, subdevvit: subdevvit) }
    let!(:post_2) { FactoryBot.create(:post) }

    it 'renders a successful response' do
      get subdevvit_url(subdevvit)
      expect(response).to be_successful
    end

    it 'shows all the posts in that subdevvit' do
      get subdevvit_url(subdevvit)

      expect(response.body).to include(post_1.title)
      expect(response.body).not_to include(post_2.title)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_subdevvit_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    it 'render a successful response' do
      get edit_subdevvit_url(subdevvit)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Subdevvit' do
        expect do
          post subdevvits_url, params: { subdevvit: valid_attributes }
        end.to change(Subdevvit, :count).by(1)
      end

      it 'redirects to the created subdevvit' do
        post subdevvits_url, params: { subdevvit: valid_attributes }
        expect(response).to redirect_to(subdevvit_url(Subdevvit.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Subdevvit' do
        expect do
          post subdevvits_url, params: { subdevvit: invalid_attributes }
        end.to change(Subdevvit, :count).by(0)
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'new_subdevvit' }
      end

      it 'updates the requested subdevvit' do
        expect { patch subdevvit_url(subdevvit), params: { subdevvit: new_attributes } }
          .to change { subdevvit.reload.name }.to(new_attributes[:name])
      end

      it 'redirects to the subdevvit' do
        patch subdevvit_url(subdevvit), params: { subdevvit: new_attributes }
        subdevvit.reload
        expect(response).to redirect_to(subdevvit_url(subdevvit))
      end
    end

    context 'with invalid parameters' do
      it 'renders an Unprocessable Entity response' do
        patch subdevvit_url(subdevvit), params: { subdevvit: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:subdevvit) { FactoryBot.create(:subdevvit) }

    it 'destroys the requested subdevvit' do
      expect do
        delete subdevvit_url(subdevvit)
      end.to change(Subdevvit, :count).by(-1)
    end

    it 'redirects to the subdevvits list' do
      delete subdevvit_url(subdevvit)
      expect(response).to redirect_to(subdevvits_url)
    end
  end
end
