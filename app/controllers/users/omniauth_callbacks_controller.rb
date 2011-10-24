# -*- encoding : utf-8 -*-
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def passaporte_web
    @user = User.find_for_passaporte_web_oauth(request.env["omniauth.auth"], current_user)
    if @user
      flash[:success] = "Autenticado com sucesso via Passaporte Web."
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:error] = "Usuário inexistente." # TODO melhorar mensagem de erro
      render :text => "Usuário não encontrado"
    end
  end
end
