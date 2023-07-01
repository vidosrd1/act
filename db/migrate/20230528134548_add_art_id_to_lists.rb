class AddArtIdToLists < ActiveRecord::Migration[7.0]
  def change
    add_column :lists, :art_id, :integer
  end
end
