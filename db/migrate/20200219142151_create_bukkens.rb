class CreateBukkens < ActiveRecord::Migration[5.2]
  def change
    create_table :bukkens do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.integer :year
      t.text :note

      t.timestamps
    end
  end
end
