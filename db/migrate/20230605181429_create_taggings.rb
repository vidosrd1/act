class CreateTaggings < ActiveRecord::Migration[7.0]
  def change
    create_table :taggings do |t|
      t.integer :article_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
