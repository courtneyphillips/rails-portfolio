require 'rails_helper'

describe "the edit a category process" do
  it "edits a category" do
    category = Category.create(:name => 'CSS', :description => 'test')
    visit category_path(category)
    click_on 'Edit Category'
    fill_in 'Description', :with => 'Wow!'
    click_on 'Update Category'
    expect(page).to have_content 'successfully'
  end

  it "gives error when no description is entered" do
    category = Category.create(:name => 'CSS', :description => 'test')
    visit category_path(category)
    click_on 'Edit'
    fill_in 'Description', :with => ''
    click_on 'Update Category'
    expect(page).to have_content 'errors'
  end

  it "gives error when no name is entered" do
    category = Category.create(:name => 'CSS', :description => 'test')
    visit category_path(category)
    click_on 'Edit'
    fill_in 'Name', :with => ''
    click_on 'Update Category'
    expect(page).to have_content 'errors'
  end


end
