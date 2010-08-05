require 'mime/types'
class ProductsController < ApplicationController
  def new
    @product  = Product.new
    @products  = Product.all
  end
  
  def create 
    @product = Product.new(params[:product])
    @product.photo_content_type = MIME::Types.type_for(params[:Filename]).to_s
    @product.save
    render :file => "products/create.js.erb", :layout => false
    return
    # respond_to do |request|
    #   puts "boom boom boom here we are\n"*10
    #   puts request.js.inspect
    #   request.html{
    #     puts "BOOM BOOM BOOM IN HTML\n"*10
    #     redirect_to new_product_url
    #     return
    #   }
    #   request.js{
    #     puts "BOOM BOOM BOOM HERE WE ARE"*10
    #   }
    # end
    
  end
end
