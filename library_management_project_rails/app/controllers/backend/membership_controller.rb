class Backend::MembershipController < ApplicationController

  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    if @user.update(user_params)
      redirect_to dashboard_index_path, notice: "Membership information updated successfully."
    else
      flash[:alert] = "User update failed"
      render :new
    end
  end

  def index
    @users =  User.all

    respond_to do |format|
      format.html
      format.xlsx
    end
  end



  private

  def user_params
    params.require(:user).permit(:total_amount_paid, :mem_start_date, :mem_end_date)
  end

end
