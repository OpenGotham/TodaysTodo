require 'spec_helper'

describe Todo do

  def valid_todo
    Todo.new(title: "A Title")
  end

  describe "completed_on_time?" do
    it "should return true if its completed date is before its due date" do
      todo = Todo.new
      todo.due_date = Time.now + 1.day
      todo.completed_date = Time.now
      todo.should be_completed_on_time
    end
    it "should return false if its completed date is after its due date" do
      todo = Todo.new
      todo.due_date = Time.now
      todo.completed_date = Time.now + 1.day
      todo.should_not be_completed_on_time
    end
    it "should return false if its completed date is nil and it has a due date" do
      todo = Todo.new
      todo.due_date = Time.now
      todo.should_not be_completed_on_time
      
    end
    it "should return true if its completed date exists and its due date is nil" do
      todo = Todo.new
      todo.completed_date = Time.now
      todo.should be_completed_on_time
    end
  end
  it "should be completed on time if its completed date is before its due date" do
  end
  describe "save" do
    describe "with valid params" do
      it "should save" do
        todo = valid_todo
        todo.save.should be_true
      end
    end
    describe "with invalid title" do
      it "should not save" do
        todo = Todo.new()
        todo.save.should_not be_true
      end
      it "should have an error on title" do
        todo = Todo.new()
        todo.save
        todo.should have_at_least(1).errors_on(:title)
      end
    end
  end

end
