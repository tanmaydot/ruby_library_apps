class DashboardController < ApplicationController
  load_and_authorize_resource class: User

  def index
    if params[:search].present?
      @users = User.where("name ILIKE ?", "%#{params[:search]}%")
    elsif params[:filter].present?
      number_of_days = params[:filter_days].to_i || 0
      @users = User.filter_user(number_of_days)
    else
      @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to dashboard_index_path, notice: "User is updated successfully"
    else
      flash[:alert] = "User update failed"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to dashboard_index_path, notice: 'User was successfully deleted.'
  end

  private

  def user_params
    params.require(:user).permit(:name, :age, :location, :email, :password, :encrypted_password)
  end
end
