class SetTransactionCompletedDefaultForListings < ActiveRecord::Migration[6.0]
  def change
    change_column_default :listings, :transaction_completed, from: true, to: false
  end
end
