class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :age
      t.string :race
      t.string :class
      t.string :special_abilities
      t.text :description
    end
  end
end
