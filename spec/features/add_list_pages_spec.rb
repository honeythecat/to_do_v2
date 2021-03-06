require 'rails_helper'

describe "the add a list process" do
  it "adds a new list" do
    visit lists_path
    click_on 'New List'
    fill_in 'Name', :with => 'Home'
    click_on 'Create List'
    expect(page).to have_content 'Lists'
  end

  it "gives error when no name is entered" do
    visit new_list_path
    click_on 'Create List'
    expect(page).to have_content 'errors'
  end




end
