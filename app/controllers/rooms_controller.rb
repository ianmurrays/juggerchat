class RoomsController < ApplicationController
  before_filter :authorize!
  
  # Shows list of rooms
  def index
    @rooms = Room.all
    
    respond_to do |f|
      f.html
    end
  end
end
