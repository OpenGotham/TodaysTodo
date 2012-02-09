require 'spec_helper'

describe "todos/new" do
  before(:each) do
    assign(:todo, stub_model(Todo,
      :title => "MyString",
      :description => "MyText",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new todo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => todos_path, :method => "post" do
      assert_select "input#todo_title", :name => "todo[title]"
      assert_select "textarea#todo_description", :name => "todo[description]"
      assert_select "input#todo_status", :name => "todo[status]"
    end
  end
end
