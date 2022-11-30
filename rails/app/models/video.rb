class Video < ApplicationRecord
  scope :by_name, -> { order(:name) }

  def self.search(search)
    if search
      video_tag = Video.find_by(tags: search)
      if video_tag
        self.where(video_id: video_tag)
      else
        @videos = Video.all
      end
    else
      @videos = Video.all
    end
  end

  def self.by_tag(tag)
    if tag.starts_with?('not')
      tag = tag.slice! "not"
      where.not("lower(tags) LIKE ?", "%#{tag.downcase}%")
    else
      where("lower(tags) LIKE ?", "%#{tag.downcase}%")
    end
  end
end
