class CreateParks < ActiveRecord::Migration[7.1]
  def change
    create_table :parks do |t|
      t.string :name
      t.references :location, null: false, foreign_key: true
      t.references :neighbourhood, null: false, foreign_key: true
      t.references :district, null: false, foreign_key: true
      t.string :cca

      t.timestamps
    end
  end
end
