class Document < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :history_downloads, dependent: :destroy

  scope :order_by_created_at, ->{order created_at: :desc}
  scope :search_name_document, ->(name_doc){where "name_document LIKE ?", "%#{name_doc}%"}

  mount_uploader :content, DocumentUploader
end
