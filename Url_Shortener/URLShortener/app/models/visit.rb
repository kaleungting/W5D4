class Visit < ApplicationRecord
  validates :shortened_id, :user_id, presence: true

  def self.record_visit!(user,shortened_url)
    Visit.create!(shortened_id: shortened_url.id,user_id:user.id)
  end

  belongs_to :user,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  belongs_to :url,
  primary_key: :id,
  foreign_key: :shortened_id,
  class_name: :ShortenedUrl

end