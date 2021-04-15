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
    it 'renders a successful response' do
      Subdevvit.create! valid_attributes
      get subdevvits_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      subdevvit = Subdevvit.create! valid_attributes
      get subdevvit_url(subdevvit)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_subdevvit_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      subdevvit = Subdevvit.create! valid_attributes
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
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post subdevvits_url, params: { subdevvit: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'new_subdevvit' }
      end

      it 'updates the requested subdevvit' do
        subdevvit = Subdevvit.create! valid_attributes
        expect { patch subdevvit_url(subdevvit), params: { subdevvit: new_attributes } }
          .to change { subdevvit.reload.name }.to(new_attributes[:name])
      end

      it 'redirects to the subdevvit' do
        subdevvit = Subdevvit.create! valid_attributes
        patch subdevvit_url(subdevvit), params: { subdevvit: new_attributes }
        subdevvit.reload
        expect(response).to redirect_to(subdevvit_url(subdevvit))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        subdevvit = Subdevvit.create! valid_attributes
        patch subdevvit_url(subdevvit), params: { subdevvit: invalid_attributes }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested subdevvit' do
      subdevvit = Subdevvit.create! valid_attributes
      expect do
        delete subdevvit_url(subdevvit)
      end.to change(Subdevvit, :count).by(-1)
    end

    it 'redirects to the subdevvits list' do
      subdevvit = Subdevvit.create! valid_attributes
      delete subdevvit_url(subdevvit)
      expect(response).to redirect_to(subdevvits_url)
    end
  end
end
