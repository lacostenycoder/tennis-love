class UsersController < ApplicationController
  include UsersHelper
  include MatchesHelper
  #before_action :authenticate, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_user, except: [:new, :create]

  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def create
    current_user
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  def edit
     @user = User.find(params[:id])
    if current_user == @user
      render 'edit'
    else
      redirect_to root_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { render :edit, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, notice: 'User was not updated.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :city, :country, :email, :password, :password_confirmation)
  end


end
