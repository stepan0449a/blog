require 'rails_helper'

RSpec.describe "nicknames/edit", type: :view do
  before(:each) do
    @nickname = assign(:nickname, Nickname.create!(
      title: "MyString",
      text: "MyString"
    ))
  end

  it "renders the edit nickname form" do
    render

    assert_select "form[action=?][method=?]", nickname_path(@nickname), "post" do

      assert_select "input[name=?]", "nickname[title]"

      assert_select "input[name=?]", "nickname[text]"
    end
  end
end
