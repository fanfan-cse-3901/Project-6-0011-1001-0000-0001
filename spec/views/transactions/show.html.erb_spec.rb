require 'rails_helper'

RSpec.describe "transactions/show", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      item: nil,
      user: nil,
      rating: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
