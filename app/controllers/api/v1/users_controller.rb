class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  swagger_controller :users, "Users Management"

  def self.add_common_params(api) 
    api.param :form, "user[name]", :string, :required, "Name"
    api.param :form, "user[age]", :integer, :optional, "Age"
    api.param_list :form, "user[status]", :string, :optional, "status: can be active or inactive", ["active", "inactive"]
  end

  swagger_api :index do
    summary "Get all users"
    notes "Nothing else, it's that simple!"
    response :ok
  end
  # GET /api/v1/users
  def index
    @users = User.all

    render json: @users
  end

  swagger_api :show do
    summary "Get a user"
    notes "get information of user by passing his user id"
    param :path, :id, :integer, :required, "ID of User"
    response :ok
    response :not_found
  end
  # GET /api/v1/users/1
  def show
    render json: @user
  end

  swagger_api :create do |api|
    summary "create a user"
    notes "make sure you pass parameters in users' hash:"
    Api::V1::UsersController::add_common_params(api)
    response :ok
    response :unprocessable_entity
  end
  # POST /api/v1/users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  swagger_api :update do |api|
    summary "update user"
    notes "make sure you pass parameters in users' hash:"
    param :path,  :id, :integer, :required, "ID of User"
    Api::V1::UsersController::add_common_params(api)
    response :ok
    response :unprocessable_entity
    response :not_found
  end
  # PATCH/PUT /api/v1/users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  swagger_api :destroy do
    summary "Delete a user"
    notes "Delete user by passing his user id"
    param :path, :id, :integer, :required, "ID of User"
    response :ok
    response :unprocessable_entity
    response :not_found
  end
  # DELETE /api/v1/users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :age, :status)
    end
end
