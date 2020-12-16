class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if  @item.save
      redirect_to "/"
    else      
      render :new
    end
  end
  private

  def  item_params 
    params.require(:item).permit(:name, :price, :category_id, :status_id,:fee_id,:place_id,:user,:detail,:day_id, :image).merge(user_id: current_user.id)
  end

end
