class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :to_dos do |t|
      t.string :body
      t.string :day
    end
  end
end
