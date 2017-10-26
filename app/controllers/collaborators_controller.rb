class CollaboratorsController < ApplicationController
  before_action :set_wiki
  
  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
    
    if @wiki.collaborators.exists?(user_id: @collaborator.id)
      flash[:notice] = "Collaborator already exists."
      redirect_to @wiki
    else
      @collaborator = Collaborator.new(wiki_id: @wiki.id, user_id: params[:user_id])
      if @collaborator.save
        flash[:notice] = "Collaborator has been added."
        redirect_to @wiki
      else
        flash.now[:alert] = "There was an error saving the collaborator. Please try again."
        redirect_to @wiki
      end
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    @collaborator_user = User.find(@collaborator.user_id)
    
    if @collaborator.destroy
      flash[:notice] = "Collaborator has been deleted."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error deleting the collaborator. Please try again."
      redirect_to @wiki
    end
  end
  
  private 
  
  def set_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
