require 'rails_helper'

RSpec.describe "collections/index", type: :view do
  before(:each) do
    assign(:collections, [
      Collection.create!(
        :user_id => 1,
        :stamp_id => "Stamp"
      ),
      Collection.create!(
        :user_id => 1,
        :stamp_id => "Stamp"
      )
    ])
  end

  it "renders a list of collections" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Stamp".to_s, :count => 2
  end
end
