class OrdersController < ApplicationController
    before_action :set_order, only: %i[ show edit update destroy ]

  def index
    @orders = Order.all
  end

  # GET /orders/:id
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # POST /orders
def create
  @order = Order.new(order_params)

  respond_to do |format|
    if @order.save
      format.html { redirect_to @order, notice: "Order was successfully created." }
      format.json { render :show, status: :created, location: @order }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @order.errors, status: :unprocessable_entity }
    end
  end
end


  # GET /orders/:id/edit
  def edit
  end

  # PATCH/PUT /orders/:id
  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Order was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /orders/:id
  def destroy
    @order.destroy
    redirect_to orders_path, notice: "Order was successfully deleted."
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.expect(order: [ :details,:count])
    end
end

