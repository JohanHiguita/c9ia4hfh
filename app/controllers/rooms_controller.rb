class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "Post successfully created"
      redirect_to rooms_path
    else
      flash[:alert] = @room.errors.full_messages.join(", ")
      render :new
    end
  end


  def destroy
    room = Room.find(params[:id])
    room.destroy
   #flash[:notice]="El post fue eliminado exitosamente"
   redirect_to rooms_path
 end

 def edit
  @room=Room.find(params[:id])
 end

 def update
    @room=Room.find(params[:id])
  if @room.update(room_params)
    # flash[:notice]= "Editado!"
    redirect_to rooms_path  
  else
    # flash[:alert] = "Falló"
    render :edit
  end
 end



 protected
 def room_params
  params.require(:room).permit(:title, :description, :beds, :guests, :image_url, :price_per_night)
end
end
