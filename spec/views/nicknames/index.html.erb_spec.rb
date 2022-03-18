require 'rails_helper'

RSpec.describe "nicknames/index", type: :view do
  before(:each) do
    assign(:nicknames, [
      Nickname.create!(
        title: "Title",
        text: "Text"
      ),
      Nickname.create!(
        title: "Title",
        text: "Text"
      )
    ])
  end

  it "renders a list of nicknames" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Text".to_s, count: 2
  end
end
