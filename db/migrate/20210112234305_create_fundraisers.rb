class CreateFundraisers < ActiveRecord::Migration[6.1]
  def change
    create_table :fundraisers do |t|
      t.string :title
      t.text :description
      t.text :donate
      t.text :share
      t.timestamps
    end
  end
end
