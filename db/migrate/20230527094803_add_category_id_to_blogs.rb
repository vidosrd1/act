class AddCategoryIdToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :category_id, :integer
  end
end
