# frozen_string_literal: true

class Admin::Admins::SessionsController < Devise::SessionsController

  layout 'admin'

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  protected

    ### アカウント編集後のリダイレクト ###
    def after_update_path_for(resource)
      admins_show_path(resource)
    end

    ### サインアップ後のリダイレクト ###
    def after_sign_in_path_for(resource)
      super(resource)
      admin_orders_path
    end

end
