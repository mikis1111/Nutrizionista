class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.string :titolo
      t.text :descrizione
      t.decimal :price

      t.timestamps
    end
  end
end
