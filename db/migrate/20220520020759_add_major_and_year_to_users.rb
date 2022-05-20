class AddMajorAndYearToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :major, :string
    add_column :users, :year, :string
  end
end
