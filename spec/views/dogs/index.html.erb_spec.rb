require 'rails_helper'

RSpec.describe "dogs/index", type: :view do
  before(:each) do
    assign(:dogs, [
      Dog.create!(
        title: "Title"
      ),
      Dog.create!(
        title: "Title"
      )
    ])
  end

  it "renders a list of dogs" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
