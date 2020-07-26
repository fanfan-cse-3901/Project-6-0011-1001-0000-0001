require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      title: "Title",
      quality: "Quality",
      price: "9.99",
      color: "Color",
      location: "Location",
      category: "Category",
      sub_category: "Sub Category",
      description: "Description",
      picture: "Picture"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Quality/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Color/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(/Sub Category/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Picture/)
  end
end
