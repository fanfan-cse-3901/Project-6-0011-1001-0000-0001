require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        title: "Title",
        quality: "Quality",
        price: "9.99",
        color: "Color",
        location: "Location",
        category: "Category",
        sub_category: "Sub Category",
        description: "Description",
        picture: "Picture"
      ),
      Item.create!(
        title: "Title",
        quality: "Quality",
        price: "9.99",
        color: "Color",
        location: "Location",
        category: "Category",
        sub_category: "Sub Category",
        description: "Description",
        picture: "Picture"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Quality".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: "Color".to_s, count: 2
    assert_select "tr>td", text: "Location".to_s, count: 2
    assert_select "tr>td", text: "Category".to_s, count: 2
    assert_select "tr>td", text: "Sub Category".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Picture".to_s, count: 2
  end
end
