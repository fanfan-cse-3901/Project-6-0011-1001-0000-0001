require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      seller_id: 1,
      title: "MyString",
      quality: "MyString",
      price: "9.99",
      color: "MyString",
      location: "MyString",
      category: "MyString",
      sub_category: "MyString",
      description: "MyString",
      picture: "MyString"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[seller_id]"

      assert_select "input[name=?]", "item[title]"

      assert_select "input[name=?]", "item[quality]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[color]"

      assert_select "input[name=?]", "item[location]"

      assert_select "input[name=?]", "item[category]"

      assert_select "input[name=?]", "item[sub_category]"

      assert_select "input[name=?]", "item[description]"

      assert_select "input[name=?]", "item[picture]"
    end
  end
end
