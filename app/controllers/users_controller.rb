class UsersController < ApplicationController
  #GET /usrs/:id
  def show
    @user = User.find(params[:id])
    # debugger
    # user = User.first  # ローカル変数
    # @user = User.first # インスタンス変数
    # @@user = User.first # グローバル変数
  end
  
  def new
    # GET app/views/users/new.html.erb
    @user = User.new
  end

  def create
    #@user = User.new(params[:user])    # 実装は終わっていないことに注意!
    
    @user = User.new(user_params)
    if @user.save
      # Success(valid paramater)
      # GET "/users/#{@user.id}"
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # redirect_to user_path(@user) 名前付きルート
      # redirect_to user_path(@user.id)
      # redirect_to user_path(1) => /users/1

      # GET "/users/#{@user.id}"
    else
      # Failure (invalid parameter)
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation)
    end

end
