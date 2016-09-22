class UsersController < ApplicationController
  before_filter :require_login

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_user_path, notice: "Perfil atualizado com sucesso."
    else
      redirect_to edit_user_path, alert: "Não foi possível atualizar o seu perfil."
    end
  end

  protected

    def user_params
      params.require(:user).permit(interest_ids: [], skill_ids: [])
    end
end
