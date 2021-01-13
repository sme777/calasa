class CreateFundraisers < ActiveRecord::Migration[6.1]
  def change
    create_table :fundraisers do |t|
      t.string :title
      t.text :description
      t.timestamp :date

      t.timestamps
    end
  end
end
