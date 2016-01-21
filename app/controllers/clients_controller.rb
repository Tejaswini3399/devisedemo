class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if current_admin.present?
      @clients = Client.all
      respond_with(@clients)
    else
      redirect_to '/admins/sign_in'
    end    
  end

  def show
    if current_admin.present?
      respond_with(@client)
    else
      redirect_to '/admins/sign_in'
    end   
  end

  def new
    if current_admin.present?
      @client = Client.new
      respond_with(@client)
    else
      redirect_to '/admins/sign_in'
    end     
  end

  def edit
  end

  def create
    if current_admin.present?
      @client = Client.new(client_params)
      @client.save
      respond_with(@client)
    else
      redirect_to '/admins/sign_in'
    end     
  end

  def update
    if current_admin.present?
      @client.update(client_params)
      respond_with(@client)
    else
      redirect_to '/admins/sign_in'
    end 
  end

  def destroy
    if current_admin.present?
      @client.destroy
      respond_with(@client)  
    else
      redirect_to '/admins/sign_in'
    end 
  end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name, :project_id)
    end
end
