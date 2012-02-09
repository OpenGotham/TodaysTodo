class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :description
      t.string :status
      t.timestamp :completed_date
      t.timestamp :due_date

      t.timestamps
    end
  end
end
