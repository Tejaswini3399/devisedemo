class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_admin.present?
      @projects = Project.all
      respond_with(@projects)
    else
      redirect_to '/admins/sign_in'
    end      
  end

  def show
    if current_admin.present?      
      respond_with(@project)
    else
      redirect_to '/admins/sign_in'
    end      
  end

  def new
    if current_admin.present?
      @project = Project.new
      respond_with(@project)
    else
      redirect_to '/admins/sign_in'
    end      
  end

  def edit
  end

  def create
    if current_admin.present?
       @project = Project.new(project_params)
       @project.save
       respond_with(@project)
    else
      redirect_to '/admins/sign_in'
    end         
  end

  def update
     if current_admin.present?
       @project.update(project_params)
       respond_with(@project)
    else
      redirect_to '/admins/sign_in'
    end     
  end

  def destroy
    if current_admin.present?
       @project.destroy
       respond_with(@project)
    else
      redirect_to '/admins/sign_in'
    end     
  end
  
  def income
    if current_admin.present?
       @projects = Project.all
       @total_income = Project.all.sum(:income)
    end  
  end 

  def expenses
    if current_admin.present?
       @projects = Project.all
       @total_expenses = Project.all.sum(:expenses)
    end  
  end 

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :income, :expenses, :client_id, :project_desc, :employee_id)
    end
end
