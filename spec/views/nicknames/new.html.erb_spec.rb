require 'rails_helper'

RSpec.describe "nicknames/new", type: :view do
  before(:each) do
    assign(:nickname, Nickname.new(
      title: "MyString",
      text: "MyString"
    ))
  end

  it "renders new nickname form" do
    render

    assert_select "form[action=?][method=?]", nicknames_path, "post" do

      assert_select "input[name=?]", "nickname[title]"

      assert_select "input[name=?]", "nickname[text]"
    end
  end
end
