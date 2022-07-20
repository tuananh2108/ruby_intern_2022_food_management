class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      check_role user
    else
      # TODO
      # flash[:error]
      render :new
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  private
  def check_role user
    if user.admin
      log_in user
      redirect_to root_path
    else
      # redirect to client page
      # TODO
      render :new
    end
  end
end
