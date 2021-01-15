class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.text :rsvp
      t.text :share

      t.timestamps
    end
  end
end
