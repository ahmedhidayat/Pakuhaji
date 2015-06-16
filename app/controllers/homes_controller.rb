class HomesController < ApplicationController
  def index
    @article = Article.all
       if @sliders = Slider.find_by_id(nil)
      @sliders = Slider.find_by_id(1)
    else  
      @sliders = Slider.first
    end 
    
    if @slider = Slider.where("id > ?",nil)
      @slider = Slider.all
    else  
      @slider = Slider.where("id > ?",@slider.id)
    end
  end
  
  def profile
    @profile = Profile.all
  end
  
  def fasility
    @fasility = Fasility.all
  end
  
  def game
    @game = Game.all
  end
  
   def gallery
    @gallery = Gallery.all
  end
  
  def packet
    @packet = Packet.all
  end
  
end
