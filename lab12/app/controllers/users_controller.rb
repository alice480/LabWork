# frozen_string_literal: true

# logic for registration and login
class UsersController < ApplicationController
  add_flash_types :success

  def beginning;  end

  def entry
    @user = User.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to '/', success: 'User was successfully created' }
      else
        format.html { redirect_to '/users/new', notice: create_message }
      end
    end
  end

  def find
    @found_user = User.find_by(login: receive_login)
    
    respond_to do |format|
      if @found_user.nil?
        format.html { redirect_to '/users/entry', notice: 'The user with such login was not found' }
      elsif @found_user.password != receive_password
        format.html { redirect_to '/users/entry', notice: 'Wrong password!' }
      else
        format.html { redirect_to '/input', success: 'Successfully' }
        log_in(@found_user)
      end
    end
  end

  private

  def create_message
    message = ''
    @user.errors['login'].each { |msg| message += "#{msg} " }
    @user.errors['password'].each { |msg| message += "#{msg} " }
    message
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:login, :password)
  end

  def receive_login
    params[:user]['login']
  end

  def receive_password
    params[:user]['password']
  end
end
