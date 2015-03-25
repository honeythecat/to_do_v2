require 'rails_helper'

describe "the edit a task process" do
  it "edits a task" do
    list = List.create(:name => 'Home')
    task = Task.create(:description => 'Wash the dog', :list_id => list.id)
    visit list_path(list)
    click_on 'Edit'
    fill_in 'Description', :with => 'Wash the cat'
    click_on 'Update Task'
    expect(page).to have_content 'successfully'
  end

  it "gives error when no description is entered" do
    list = List.create(:name => 'Home')
    task = Task.create(:description => 'Wash the dog', :list_id => list.id)
    visit edit_list_task_path(list, task)
    fill_in 'Description', :with => ''
    click_on 'Update Task'
    expect(page).to have_content 'errors'
  end



end
