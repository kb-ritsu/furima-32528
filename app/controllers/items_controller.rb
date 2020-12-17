class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :user_check, only: [:edit, :create,:destroy]
  before_action :set_item, only: [:show, :edit,:update,:destroy]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to root_path
    else      
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    if  item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def  item_params 
    params.require(:item).permit(:name, :price, :category_id, :status_id,:fee_id,:place_id,:detail,:day_id, :image).merge(user_id: current_user.id)
  end
  def  set_item
    @item = Item.find{params[:id]}
  end
  def  user_check
    unless current_user.id == @item.user.id
      redirect_to action: :index
    end
  end
end
