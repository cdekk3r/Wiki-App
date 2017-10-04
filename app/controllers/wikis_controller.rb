class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
