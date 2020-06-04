class CollaboratorsController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by_email(params[:email])

    collaborator = @wiki.collaborators.build(user: @user)

    if collaborator.save
      flash[:notice] = "You have added #{@user.email} to your wikki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error, please try again."
      redirect_to edit_wiki_path(@wiki)
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.find(user_id: (params[:id]))

    if @collaborator.destroy
      flash[:notice] = "Collaborator removed from wiki."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "Collaborator could not be removed."
      redirect_to edit_wiki_path(@wiki)
    end
  end
end
