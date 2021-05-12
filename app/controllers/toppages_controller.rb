class ToppagesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @tasks=current_user.tasks.order(id: :desc).page(params[:page])
  end
end
