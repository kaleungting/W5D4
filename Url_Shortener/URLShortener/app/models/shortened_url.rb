class ShortenedUrl < ApplicationRecord

  validates :short_url, presence: true, uniqueness: true

    def self.random_code
      code = "www.#{SecureRandom.urlsafe_base64}.com"
      until !ShortenedUrl.exists?(short_url: code)
        code = "www.#{SecureRandom::urlsafe_base64}.com"
      end
        code
    end

    def self.convert_url(user, url)
      result = ShortenedUrl.random_code
      ShortenedUrl.create!(long_url: url,short_url: result,submitter_id: user.id)
    end

    belongs_to :submitter,
    primary_key: :id,
    foreign_key: :submitter_id,
    class_name: :User

    has_many :visitors,
    primary_key: :id,
    foreign_key: :shortened_id,
    class_name: :Visit

end