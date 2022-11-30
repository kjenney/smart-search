class Video < ApplicationRecord
  scope :by_name, -> { order(:name) }

  def self.send_chain(methods)
    methods.inject(self) { |result, method| result.send(*method) }
  end

  def self.by_tag(tag)
    if tag.starts_with?('not')
      tag.slice! "not"
      where.not("lower(tags) LIKE ?", "%#{tag.downcase}%")
    else
      where("lower(tags) LIKE ?", "%#{tag.downcase}%")
    end
  end
end
