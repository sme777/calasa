class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :content
      t.text :title
      t.timestamp :date
      t.integer :user_id

      t.timestamps
    end
  end
end
