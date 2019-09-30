require 'test_helper'

class TodoListTest < ActiveSupport::TestCase

  def setup
    @list = TodoList.new(title: "Benjamin", description: "The man who hopes dies fasting", due_date: DateTime.now)
  end

end
