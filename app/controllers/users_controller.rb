class UsersController < ApplicationController
def index
    @user = User.all
    render :index
  end

  def show
    @user = User.find(params["id"])
    render :show
  end

  def create
    @user = User.create(
      name: params["name"],
      email: params["email"],
      role: params["role"],
    )

    if @user.valid?
      render :show
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def update
    @user = User.find(params["id"])
    @user.update(
      name: params["name"] || @user.name,
      email: params["email"] || @user.email,
      role: params["role"] || @user.role
    )
    if @user.valid?
      render :show
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def destroy
    @user = User.find(params["id"])
    @user.destroy

    render json: { message: "User deleted" }
  end
end
