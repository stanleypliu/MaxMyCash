class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.integer :currency_amount
      t.string :type
      t.boolean :transaction_completed
      t.string :location
      t.text :message

      t.timestamps
    end
  end
end
