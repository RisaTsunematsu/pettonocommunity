class Public::UsersController < ApplicationController
  def show
   @user = User.find(params[:id])
   @posts = @user.posts
  end
  
  def edit
   @handlename = current_user.handlename
   @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @handlename = current_user.handlename
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      @users = User.all
      render "edit"
    end
  end
  
  def unsubscribe
  end

  def is_deleted
   @user= current_user
   if @user.update(is_deleted: true)
    sign_out_and_redirect(current_user)
   else
    render "unsubscribe"
   end
  end

  def withdrawal
   @user= current_user
   if @user.update(is_deleted: true)
    sign_out_and_redirect(current_user)
   else
    render "unsubscribe"
   end
  end
  
  private

  def user_params
    params.require(:user).permit(:handlename, :introduction, :profile_image,:is_deleted)
  end

end
