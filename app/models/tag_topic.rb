class TagTopic < ApplicationRecord
  validates :topic, presence: true
  has_many :map_taggings, foreign_key: :tag_id, class_name: "Tagging"
  has_many :links, through: :map_taggings, source: :shortened_url

  def popular_links
    list = ShortenedUrl.select("shortened_urls.*", "COUNT(shortened_urls.id)")
                       .joins(:visits)
                       .joins(:mapped_tags)
                       .where("taggings.tag_id = ?", self.id)
                       .group("shortened_urls.id")
                       .order("2 desc")
                       .limit(5)
    p list
    #list = Visit.select(:short_url_id, "COUNT(visits.short_url_id)").order("COUNT(visits.short_url_id) DESC").group(:short_url_id).limit(5)
    #p list
  end
end
