class AddPetRefToReviews < ActiveRecord::Migration[7.2]
  def change
    add_reference :reviews, :pet, null: false, foreign_key: true
  end
end