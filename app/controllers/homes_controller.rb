class HomesController < ApplicationController
  def index
    @article = Article.page(params[:page]) .per(3)
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
    @fasility = Fasility.page(params[:page]) .per(3)
  end
  
  def game
    @game = Game.page(params[:page]) .per(3)
  end
  
   def gallery
    @gallery = Gallery.all   
  end
    
    def gallery_show
      @gallery = Gallery.all
      @gallery_show_home = Gallery.find_by_id(params[:id])
    end
  
  def packet
    @packet = Packet.page(params[:page]) .per(4)
  end
  
end
