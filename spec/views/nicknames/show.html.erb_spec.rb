require 'rails_helper'

RSpec.describe "nicknames/show", type: :view do
  before(:each) do
    @nickname = assign(:nickname, Nickname.create!(
      title: "Title",
      text: "Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Text/)
  end
end
