class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_admin.present?
      @employees = Employee.all
      respond_with(@employees)
    else
      redirect_to '/admins/sign_in'
    end
  end

  def show
    if current_admin.present?
      respond_with(@employee)
    else
      redirect_to '/admins/sign_in'
    end   
  end

  def new
    if current_admin.present?
      @employee = Employee.new
      respond_with(@employee)
    else
      redirect_to '/admins/sign_in'
    end      
  end

  def edit
  end

  def create
    if current_admin.present?
      @employee = Employee.new(employee_params)
      @employee.save
      respond_with(@employee)
    else
      redirect_to '/admins/sign_in'
    end      
  end

  def update
    if current_admin.present?
      @employee.update(employee_params)
      respond_with(@employee)
    else
      redirect_to '/admins/sign_in'
    end      
  end

  def destroy
    if current_admin.present?
      @employee.destroy
      respond_with(@employee)
    else
      redirect_to '/admins/sign_in'
    end  
    
  end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :emp_id, :location, :project_id, :email)
    end
end
