require 'rails_helper'

RSpec.describe "dogs/show", type: :view do
  before(:each) do
    @dog = assign(:dog, Dog.create!(
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
