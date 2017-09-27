class FormsController < ApplicationController
  before_action :re_route 

  def new
    @form = Form.new
  end
  
  def create
    @form = Form.new(forms_params)
    if @form.save
      flash[:success] = "Information successfully saved."
      redirect_back fallback_location: root_path
    else
      render :new
    end
  end

  private

    def forms_params
      params.require(:form).permit(:title, :occupation, :nationality, :full_name, :mobile, :email)
    end

    def re_route
      redirect_to current_admin unless !current_admin and return 
      flash[:warning] = "You can't access that page because you're logged in. Log out to view that"
    end
end
