class AdminStaticPagesController < ApplicationController
  before_action :check_login?

  def home; end

  private
  def check_login?
    # Neu chua dang nhap thi khong the truy cap trang admin
    return if logged_in?

    redirect_to login_path
  end
end
