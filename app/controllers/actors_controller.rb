class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def search_actor
    @actors = Actor.where(name: params[:search])

    render :index
  end
end
