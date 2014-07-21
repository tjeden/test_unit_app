class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def destroy
    @product = Product.find(params[:id])
    @product.delete
    redirect_to products_path
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(permitted_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(permitted_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def permitted_params
    params[:product].permit(:title, :price, :description)
  end
end
