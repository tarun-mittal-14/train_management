class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :train, null: false, foreign_key: true
      t.integer :seats

      t.timestamps
    end
  end
end
