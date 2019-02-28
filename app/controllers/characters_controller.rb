class CharactersController < ApplicationController

  # データ管理のところはログインしてないとだめでーす
  before_action :authentication, only: [:new, :create, :edit, :update, :destroy]

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
end
