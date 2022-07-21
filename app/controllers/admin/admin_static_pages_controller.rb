class Admin::AdminStaticPagesController < Admin::AdminController
  before_action :check_login?

  def home; end
end
