class Todo < ActiveRecord::Base
  #title:string, description:text, status:string, completed_date:timestamp, due_date:timestamp

  belongs_to :user

  validates :title, :presence => true

  def completed_on_time?
    !completed_date.nil? && (due_date.nil? || completed_date <= due_date)
  end

  

end
