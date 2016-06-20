class AddPhotoToReceipts < ActiveRecord::Migration
  def change
    add_column :receipts, :photo, :string
  end
end
