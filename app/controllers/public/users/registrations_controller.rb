# frozen_string_literal: true

class Public::Users::RegistrationsController < Devise::RegistrationsController

layout 'public'
  
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

protected

  ### アカウント編集後のリダイレクト ###
  def after_update_path_for(resource)
    users_show_path(resource)
  end

  ### サインイン後のリダイレクト ###
  def after_sign_in_path_for(resource)
    super(resource)
    root_path
  end

  ### サインアップ後のリダイレクト ###
  def after_sign_up_path_for(resource)
    super(resource)
    root_path
  end

  # ### アカウント編集のパスワード無し設定 ###
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def configure_permitted_parameters
    added_attrs = [:name, :introduction, :image, :is_deleted]
    ### サインアップ時のカラム追加 ###
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    ### アカウント編集のカラム追加 ###
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

end
