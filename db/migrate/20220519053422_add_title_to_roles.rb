class AddTitleToRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :title, :string
  end
end
