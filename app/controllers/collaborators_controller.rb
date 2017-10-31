class CollaboratorsController < ApplicationController
  before_action :set_wiki
  
  def new
    @collaborator = Collaborator.new
    @user = User.all
  end

  def create
    @collaborator_user = User.find_by_email(params[:collaborator])

    if @wiki.collaborators.exists?(user_id: @collaborator_user.id)
      flash[:notice] = "#{@collaborator_user.email} is already a collaborator."
      redirect_to @wiki
    else
      @collaborator = Collaborator.new(user_id: @collaborator_user.id, wiki_id: @wiki.id)
      if @collaborator.save
        flash[:notice] = "Collaborator #{@collaborator_user.email} was saved."
        redirect_to @wiki
      else
        flash.now[:alert] = "There was an error saving the collaborator. Please try again."
        redirect_to @wiki
      end
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    
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
