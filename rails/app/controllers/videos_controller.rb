class VideosController < ApplicationController
  def index
    @page_title = 'Videos'
    @videos = Video.all
  end

  def show
    @page_title = 'Video'
    @video = Video.find(params[:id])
  end

  # Tags separated by /
  def search
    @page_title = 'Video Search'
    tags = params[:tags]
    tags_array = tags.split('/')
    method_array = []
    tags_array.each do |tag|
      method_array.append([:by_tag, tag])
    end
    @videos = Video.send_chain(method_array)
  end
end