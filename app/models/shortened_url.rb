class ShortenedUrl < ApplicationRecord
  validates :user_id, :short_url, :long_url, presence: true
  validates :short_url, uniqueness: true
  belongs_to :submitter, foreign_key: :user_id, class_name: "User"
  has_many :visits, foreign_key: :short_url_id, class_name: "Visit"
  has_many :visitors, through: :visits, source: :visitor

  def self.create_short_url(user, long_url)
    new_code = random_code
    ShortenedUrl.create!(user_id: user.id, short_url: new_code, long_url: long_url)
  end

  def self.random_code
    loop do
      short_url = SecureRandom::urlsafe_base64
      return short_url unless exists?(short_url: short_url)
    end
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select(:user_id).distinct.count
  end

  def num_recent_uniques
    Visit.where("created_at BETWEEN NOW() - INTERVAL '10 minutes' AND NOW()")
  end
end

