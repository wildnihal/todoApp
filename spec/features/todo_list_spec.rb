require 'rails_helper'
require 'byebug'

RSpec.feature "TodoLists", type: :feature do

  describe "Creating todo lists" do
    let!(:user)  {User.create!(email:"nihaldhakal41@gamil.com", password:"Nihald")}

    before do
      visit root_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Log in"
    end
    it "redirects to the todo list index page on success" do
      expect(page).to have_content("New Todo List")
      expect(page).to have_content("Title")
      expect(page).to have_content("Description")
      expect(page).to have_content("Date")
      expect(page).to have_content("Priority")
    end
    let!(:todo) {TodoList.new(title:"Nihal", description:"Pain build me up a believer",priority:4,user_id: user.id)}

    it "redirects to the todo list new page on success" do
      click_link("New Todo List")
      visit new_todo_list_path
      expect(page).to have_content("New Todo ")
      fill_in "list_title", with: todo.title
      fill_in "list_description", with: todo.description
      select todo.priority, :from => "list_priority"
      click_button "Create Todo list"
    end

    it "redirects tot he todo list show page on success" do

    end
  end
end
