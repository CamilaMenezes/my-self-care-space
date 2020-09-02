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
      redirect_to my_profile_path, notice: "Seu agendamento foi solicitado. Aguarde a confirmção!"
    else
      render :new, alert: "Seu agendamento não pode ser socilitado"
    end
  end


  def confirmation
    @order = Order.find(params[:order_id])
    @order.status = "Confirmado"
    if @order.save
      redirect_to my_profile_path, notice: 'Seu agendamento foi confirmado!'
    else
      redirect_to my_profile_path, alert: 'Seu agendamento não pode ser confirmado'
    end
  end
  
  def cancelation
    @order = Order.find(params[:order_id])
    @order.status = "Cancelado"
    if @order.save
      redirect_to my_profile_path, notice: 'Seu agendamento foi cancelado!'
    else
      redirect_to my_profile_path, alert: 'Seu agendamento não pode ser cancelado'
    end
  end

  private

  def order_params
    params.require(:order).permit(:reservation)
  end
end
