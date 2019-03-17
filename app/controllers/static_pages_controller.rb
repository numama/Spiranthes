class StaticPagesController < ApplicationController

  def top
    @characters = [Character.last]
  end

  def guild
    
  end

  def what
    
  end

  def qanda
    
  end

end
