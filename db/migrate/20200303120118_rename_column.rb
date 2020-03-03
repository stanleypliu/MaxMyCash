class RenameColumn < ActiveRecord::Migration[6.0]
  def change
  	rename_column :listings, :type, :currency
  end
end
