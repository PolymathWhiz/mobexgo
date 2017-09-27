class AdminsController < ApplicationController
  before_action :set_admin, only: :show
  before_action :prevent_access, only: :show

  def show
    @list = Form.all
    @males = Form.where("title = ?", 'Male').count
    @females = Form.where("title = ?", 'Female').count    
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def prevent_access
      render_404 unless current_admin
    end
end
