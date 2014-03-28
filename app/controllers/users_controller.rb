class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user=User.find(params[:id])
  end

  def create
    params.permit!
    @user = User.new(params[:user])

    if @user.save
      SignupMailer.confirm_email(@user).deliver
      redirect_to @user, :notice=> 'Cadastro criado com sucesso!'
    else
      render :new
    end
  end

  def update
    params.permit!
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user,
                  :notice=> 'Cadastro atualizado com sucesso!'
    else
      render :update
    end
  end

end