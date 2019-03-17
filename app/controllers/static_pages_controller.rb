class StaticPagesController < ApplicationController

  def top
    @characters = Character.where(is_picked: true)
  end

  def guild
    
  end

  def information
    
  end

  def qanda
    
  end

end
