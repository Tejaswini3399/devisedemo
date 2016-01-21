class HomeController < ApplicationController
  def index
    unless current_admin.present?
       redirect_to '/admins/sign_in'
     end
	  @employees = Employee.all
  end

  def logout
    reset_session
      flash[:notice] = "Logout successful. Thank you! "
    redirect_to url_for(:controller => 'home', :action => 'index')
  end
end
