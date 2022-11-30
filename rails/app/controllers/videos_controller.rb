class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
  end

  def search
    word1 = params[:word_1]
    word2 = params[:word_2]
    @videos = Video.by_tag(word1).by_tag(word2)
  end
end