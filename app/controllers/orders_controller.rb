class OrdersController < ApplicationController

  def new
    @service = Service.find(params[:service_id])
    @new_order = Order.new
  end
  
  def create
    @service = Service.find(params[:service_id])
    @new_order = Order.new(order_params)
    @new_order.user = current_user
    @new_order.status = "Em espera"
    @new_order.service = @service
    @new_order.final_price = @service.price
    if @new_order.save
      redirect_to services_path
    else
      render :new
    end
  end

  def update
    if @order.update(service_params)
      redirect_to @service
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:reservation)
  end
end
