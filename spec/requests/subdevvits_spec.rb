 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/subdevvits", type: :request do
  
  # Subdevvit. As you add validations to Subdevvit, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Subdevvit.create! valid_attributes
      get subdevvits_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      subdevvit = Subdevvit.create! valid_attributes
      get subdevvit_url(subdevvit)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_subdevvit_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      subdevvit = Subdevvit.create! valid_attributes
      get edit_subdevvit_url(subdevvit)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Subdevvit" do
        expect {
          post subdevvits_url, params: { subdevvit: valid_attributes }
        }.to change(Subdevvit, :count).by(1)
      end

      it "redirects to the created subdevvit" do
        post subdevvits_url, params: { subdevvit: valid_attributes }
        expect(response).to redirect_to(subdevvit_url(Subdevvit.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Subdevvit" do
        expect {
          post subdevvits_url, params: { subdevvit: invalid_attributes }
        }.to change(Subdevvit, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post subdevvits_url, params: { subdevvit: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested subdevvit" do
        subdevvit = Subdevvit.create! valid_attributes
        patch subdevvit_url(subdevvit), params: { subdevvit: new_attributes }
        subdevvit.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the subdevvit" do
        subdevvit = Subdevvit.create! valid_attributes
        patch subdevvit_url(subdevvit), params: { subdevvit: new_attributes }
        subdevvit.reload
        expect(response).to redirect_to(subdevvit_url(subdevvit))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        subdevvit = Subdevvit.create! valid_attributes
        patch subdevvit_url(subdevvit), params: { subdevvit: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested subdevvit" do
      subdevvit = Subdevvit.create! valid_attributes
      expect {
        delete subdevvit_url(subdevvit)
      }.to change(Subdevvit, :count).by(-1)
    end

    it "redirects to the subdevvits list" do
      subdevvit = Subdevvit.create! valid_attributes
      delete subdevvit_url(subdevvit)
      expect(response).to redirect_to(subdevvits_url)
    end
  end
end
