class StaticPagesController < ApplicationController

  def top
    @characters = Character.where(is_picked: true)
    @title = "ラスピリちょこっと攻略解説 | ラストピリオド"
  end

  def guild
    
  end

  def information
    
  end

  def qanda
    
  end

end
