class Todo < ActiveRecord::Base
  #title:string, description:text, status:string, completed_date:timestamp, due_date:timestamp

  validates :title, :presence => true
  

  def hello_world
    "Hello World"
  end

  def completed_on_time?
    !completed_date.nil? && (due_date.nil? || completed_date <= due_date)
  end

end
