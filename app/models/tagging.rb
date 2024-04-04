class Tagging < ApplicationRecord
  belongs_to :shortened_url, foreign_key: :short_url_id
  validates :short_url_id, :tag_id, presence: true
end
