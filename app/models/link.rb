class Link < ActiveRecord::Base
  has_one :analytic
  attr_accessible :http_status, :long_url, :short_url

  before_validation :generate_short_url

  validates :long_url, :presence => true
  validates :short_url, :presence => true

  private

  def generate_short_url
    charset = ('a'..'z').to_a + (0..9).to_a

    begin
      uniquekey = (0...5).map{charset.to_a[rand(charset.size)]}.join
    end while (not Link.find_by_short_url(uniquekey).blank?)

    write_attribute(:short_url, uniquekey)
  end

end
