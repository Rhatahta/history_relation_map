class CreateLandmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :landmarks do |t|
      t.string :name, null: false
      t.text :description_with_person
      t.decimal :longitude, precision: 9, scale: 6,  null: false
      t.decimal :latitude, precision: 8, scale: 6,  null: false
      t.string :address
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
