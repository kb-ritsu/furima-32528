class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.create(item_params)
   
    if  @item.save
      redirect_to "/"
    else      
      redirect_to action: :new
    end
  end
  private

  def  item_params 
    params.require(:item).permit(:name, :price, :category_id, :status_id,:fee_id,:place_id,:user,:detail,:day_id).merge(user_id: current_user.id)
  end

end
