class RoomsController < ApplicationController
  before_filter :authorize!
  
  # Shows list of rooms
  def index
    @rooms = Room.all
    
    respond_to do |f|
      f.html
    end
  end
  
  def new
    @room = Room.new
    
    respond_to do |f|
      f.html
    end
  end
  
  def create
    @room = Room.new params[:room]
    
    respond_to do |f|
      if @room.save
        # Change the creator now
        @room.set_creator! current_user
        
        f.html { redirect_to room_path(@room) }
      else
        f.html { render :action => :new }
      end
    end
  end
  
  def destroy
    @room = Room.find params[:id]
    
    @room.destroy if @room.creator == current_user
    
    respond_to do |f|
      f.html { redirect_to rooms_path }
    end
  end
end
