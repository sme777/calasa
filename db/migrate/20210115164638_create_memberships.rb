class CreateMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :memberships do |t|
      t.text :name
      t.text :email

      t.timestamps
    end
  end
end
