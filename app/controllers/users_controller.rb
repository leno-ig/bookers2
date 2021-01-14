class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_elem, only: [:show, :edit, :update]
  before_action :reject_edit, only: [:edit, :update]

  def index
    @list = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @elem.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@elem)
    else
      render :edit
    end
  end

  private
  def find_elem
    @elem = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def reject_edit
    redirect_to user_path(current_user) if @elem.id != current_user.id
  end
end
