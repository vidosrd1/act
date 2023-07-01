class Article < ApplicationRecord
  belongs_to :user
  #belongs_to :tag
  has_one_attached :image
  has_many_attached :pictures
  has_rich_text :body
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  #attr_accessor :tag_names
  attr_writer :tag_names
  after_save :assign_tags

  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end

  def image_as_thumbnail
    return unless image.content_type.in?(%w[image/jpeg image/png image/jpg])
    image.variant(resize_to_limit: [300, 300]).processed
  end

  def pictures_as_thumbnails
    pictures.map do |picture|
      picture.variant(resize_to_limit: [150, 150]).processed
    end
  end

  def pictures_as_thumbnails(article)
    article.variant(resize_to_limit: [200, 200]).processed
  end

  private

  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end
end
