class BasketItemsController < ApplicationController
  
  # GET /basket_items
  # GET /basket_items.json
  def index
    @basket_items = BasketItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @basket_items }
    end
  end

  # GET /basket_items/1
  # GET /basket_items/1.json
  def show
    @basket_item = BasketItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @basket_item }
    end
  end

  # GET /basket_items/new
  # GET /basket_items/new.json
  def new
    @basket_item = BasketItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @basket_item }
    end
  end

  # GET /basket_items/1/edit
  def edit
    @basket_item = BasketItem.find(params[:id])
  end

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])    
    @basket_item = @cart.add_product(product.id)    
    respond_to do |format|
      if @basket_item.save
        format.html { 
          redirect_to @basket_item.cart, :notice => 'Basket item was successfully created.' 
        }        
        format.json { 
          render :json => @basket_item, :status => :created, :location => @basket_item 
        }
      else
        format.html { 
          render :action => "new" 
        }
        format.json { 
          render :json => @basket_item.errors, :status => :unprocessable_entity 
        }
      end
    end
  end
      
  # PUT /basket_items/1
  # PUT /basket_items/1.json
  def update
    @basket_item = BasketItem.find(params[:id])

    respond_to do |format|
      if @basket_item.update_attributes(params[:basket_item])
        if @basket_item.quantity > 0
          notice = 'Basket item was successfully updated.'          
        else
          @basket_item.destroy
          notice = 'Basket item was removed.'            
        end
        format.html { 
          redirect_to cart_path(current_cart), :notice => notice  
        }
        format.js {
          render :layout => false
        }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @basket_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /basket_items/1
  # DELETE /basket_items/1.json
  def destroy
    @basket_item = BasketItem.find(params[:id])
    @basket_item.destroy
    
    @cart = current_cart

    respond_to do |format|
      format.html { 
        redirect_to cart_path(current_cart), :notice => 'Basket item was removed.'  
      }
      format.js {
        render :layout => false
      }
      format.json { head :no_content }
    end
  end  
end
