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

RSpec.describe "/works", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Work. As you add validations to Work, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Work.create! valid_attributes
      get works_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      work = Work.create! valid_attributes
      get work_url(work)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_work_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      work = Work.create! valid_attributes
      get edit_work_url(work)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Work" do
        expect {
          post works_url, params: { work: valid_attributes }
        }.to change(Work, :count).by(1)
      end

      it "redirects to the created work" do
        post works_url, params: { work: valid_attributes }
        expect(response).to redirect_to(work_url(Work.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Work" do
        expect {
          post works_url, params: { work: invalid_attributes }
        }.to change(Work, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post works_url, params: { work: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested work" do
        work = Work.create! valid_attributes
        patch work_url(work), params: { work: new_attributes }
        work.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the work" do
        work = Work.create! valid_attributes
        patch work_url(work), params: { work: new_attributes }
        work.reload
        expect(response).to redirect_to(work_url(work))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        work = Work.create! valid_attributes
        patch work_url(work), params: { work: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested work" do
      work = Work.create! valid_attributes
      expect {
        delete work_url(work)
      }.to change(Work, :count).by(-1)
    end

    it "redirects to the works list" do
      work = Work.create! valid_attributes
      delete work_url(work)
      expect(response).to redirect_to(works_url)
    end
  end
end
