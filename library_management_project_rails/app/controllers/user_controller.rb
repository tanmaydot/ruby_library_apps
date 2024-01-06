class UserController < ApplicationController
  load_and_authorize_resource

  def create
    # byebug
    @user = User.create!(user_params)
    if @user.save!
      redirect_to dashboard_index_path, notice: "User is created successfully"
    else
      flash[:alert] = "User creation failed"
      render :new
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :age, :location, :email, :password)
  end
end
