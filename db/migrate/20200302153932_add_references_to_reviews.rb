class AddReferencesToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :reviewer
    add_reference :reviews, :reviewee
  end
end
