class Book < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  validates :title, :authors, :isbn, :publisher, :published_date, :language, :pages, :category_id, :user_id, presence: true
  validates :isbn, length: { minimum: 10 }
  validates :pages, numericality: { only_integer: true, greater_than: 0 }

  mount_uploader :cover, CoverUploader
end
