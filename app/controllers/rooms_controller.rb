require "juggernaut"

class RoomsController < ApplicationController
  before_filter :authorize!
  
  # Shows list of rooms
  def index
    @rooms = Room.all
    
    respond_to do |f|
      f.html
    end
  end
  
  def show
    @room = Room.find params[:id]
    
    unless @room.password.nil? or @room.is_user_in?(current_user)
      # Redirect him to the "login" page for the room
      redirect_to password_room_path(@room) and return
    else
      # Add this user to the list of active ones on the room
      @room.add_user! current_user
    end
    
    # Notify that we joined, to update number of users connected to chat room
    Juggernaut.publish(@room.juggername, {:number_users => @room.users.count})
    
    respond_to do |f|
      f.html
    end
  end
  
  def password
    @room = Room.find params[:id]
    
    respond_to do |f|
      f.html
    end
  end
  
  def login
    @room = Room.find params[:id]
    
    unless @room.password == params[:password]
      render :action => :password
    else
      # Add the user to the list
      @room.add_user! current_user
      redirect_to room_path(@room)
    end
  end
  
  def new
    @room = Room.new
    
    respond_to do |f|
      f.html
    end
  end
  
  def create
    params[:room][:password] = nil if params[:room][:password] == ''
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
  
  def publish
    @room = Room.find params[:id]
    
    # TODO: Check password or something!
    if params[:message] == ''
      return # Do nothing, since the message is empty
    end
    
    payload = {:message => params[:message], :author => current_user.name}
    Juggernaut.publish(@room.juggername, payload)
    
    respond_to do |f|
      f.js
    end
  end
end
