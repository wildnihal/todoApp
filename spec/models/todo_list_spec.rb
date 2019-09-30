require 'rails_helper'
# require  '../../app/models/todo_list.rb'


RSpec.describe TodoList, type: :model do
  describe  'associations' do
    it {is_expected.to belong_to(:user)}

  end

  context 'validation' do
    let!(:user)  {User.create!(email:"nihaldhakal41@gamil.com", password:"Nihald")}
    let!(:todo)  {TodoList.new(title:"Nihal", user_id: user.id)}
    it 'is valid if everything is ok' do
      expect(todo.save).to be(true)
    end
    it 'is invalid if it has no title' do
      todo.title = nil
      expect(todo.save).to be(false)
      expect(todo.errors.full_messages).to eq(["Title can't be blank"])
    end


    it 'is invalid if title doesnt have length less than 50 ' do
      todo.title = "t" * 51
      expect(todo.save).to be(false)
      expect(todo.errors.full_messages).to eq(["Title is too long (maximum is 50 characters)"])
    end

    it 'is invalid if description has length less than 200 ' do
      todo.title = "sample title"
      todo.description = "d" *201
      expect(todo.save).to be(false)
      expect(todo.errors.full_messages).to eq(["Description is too long (maximum is 200 characters)"])
    end

    it 'is invalid if priority range is greater than 6' do
      todo.priority = 7
      expect(todo.save).to be(false)
      expect(todo.errors.full_messages).to eq(["Priority is not included in the list"])
    end

  end

end
