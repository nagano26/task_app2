class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to room_path(@room), notice: "お部屋の投稿したよー！！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @room = Room.find(params[:id])
    if @room.user != current_user
      redirect_to room_path, alert: "ちょっと何やってるんですか？不正です！！"
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room), notice: "お部屋の更新したよー！！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def search 
    @area = params[:area]
    @key = params[:keyword]
    if params[:keyword] != nil
      @rooms = Room.search(params[:keyword])
    elsif params[:area] != nil
      @rooms = Room.search(params[:area])
    else
      @rooms = Room.all
    end
    render "index"
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to user_path(room.user), notice: "お部屋の削除したよー！！"
  end

  private
  def room_params
    params.require(:room).permit(:room_name, :room_body, :room_price, :address, :room_image)
  end
end
