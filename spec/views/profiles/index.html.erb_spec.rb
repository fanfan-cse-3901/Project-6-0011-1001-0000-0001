require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        item: "Item",
        email: "Email"
      ),
      Profile.create!(
        item: "Item",
        email: "Email"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", text: "Item".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
