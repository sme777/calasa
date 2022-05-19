class AddRankToRoles < ActiveRecord::Migration[6.1]
  def change
    add_column :roles, :rank, :integer
  end
end
