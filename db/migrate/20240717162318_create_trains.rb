class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.string :name
      t.string :source
      t.string :destination
      t.string :route
      t.integer :seats

      t.timestamps
    end
  end
end
