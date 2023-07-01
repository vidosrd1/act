class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  has_rich_text :body
  #scope :sorted,
  #->{ order(arel_table(:published_at).desc.nulls_first)
  #  .order(update_at: :desc)}
end
