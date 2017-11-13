class BooksController < ApplicationController
  def index
    render plain: 'GET books#index'
  end

  def show
    render plain: "GET books#show for id \n  #{params[:id]}"
  end

  def create
    render plain: "POST books#create with body \n  #{request.raw_post}\n"
  end
end
