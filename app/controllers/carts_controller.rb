# encoding: UTF-8
class CartsController < ApplicationController
  
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    begin
      @cart = Cart.find(params[:id])
      @user = User.new
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to products_url, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @cart }
      end
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @cart.destroy
    
    session[:cart_id] = nil

    respond_to do |format|
      format.html { 
        redirect_to products_url,
        notice: 'Obsah košíku byl vysypán na zem. Zaměstnanci jej nyní uklízí.' 
      }
      format.json { 
        head :ok 
      }
    end    
  end
  
  # incoming user defined by email or address + cart.id => send mail to gimli
  def confirm
    @cart = Cart.find(params[:id])
    user = User.new(params[:user])
    @message = "\n"
    order = ""
    @cart.basket_items.each do |item|
      order = order + "#{item.product.name}\t\t #{item.quantity}ks\t#{item.quantity * item.price}Kč\n"
    end
    
    @message = @message + order
    
    if params[:delivery] == "poštou"
      # check address
      @message = @message + "Poštovné\t\t   \t100.0Kč\n"
      @message = @message + "Celkem\t\t\t   \t#{@cart.total_price+100}Kč\n\n"
      @message = @message + "Částku #{@cart.total_price+100} (včetně 100Kč za poštovné) odešli na:\n"
      @message = @message + "účet č. 51-6074180267/0100\nvariabilní symbol: #{params[:id]}\n\nZásilka ti poté bude odeslána na adresu:\n"
      address = user.name + " " + user.surname + "\n" + user.street + "\n" + user.zipCode + " " + user.city
      @message = @message + address
      @message = @message + "\n\nZboží pro Tebe bude rezervováno po dobu 7 dní."
    else
      # check email valid?
      if user.email == ""
        flash[:alert]="emailová adresa je chybně zadaná"
        redirect_to :action => 'show'
        return
      end
      @message = @message + "Celkem\t\t\t   \t#{@cart.total_price}Kč\n\n"
      
      @message = @message + "Díky za objednávku. Na uvedeném emailu (#{user.email}) Tě budeme kontaktovat."
    end
    
    @message = @message + "\n\nNejsme plátci DPH.\nV případě jakýchkoli nesrovnalostí nás neváhej kontaktovat na emailu info@tumatemate.cz.\n\nDěkujeme za objednávku."
    # control email
    mail = ActionMailer::Base.mail(:from => "tumatemate", :to => user.email, :subject => "[Maté]: objednávka #{params[:id]}".encode("UTF-8"), :body => @message.encode("UTF-8"))
    mail.deliver
    # checkout email
    checkout = "Košík číslo: #{@cart.id}\n\n"
    checkout = checkout + order + "\n"
    if !address.nil?
      checkout = checkout + address + "\n"
    end
    checkout = checkout + "email: " + user.email + "\n\n"
    checkout = checkout + params[:message] + "\n"
    
    checkoutMail = ActionMailer::Base.mail(:from => "delivery@tumatemate.cz", :to => "info@tumatemate.cz", :subject => "[Maté]: objednávka #{params[:id]}".encode("UTF-8"), :body => checkout.encode("UTF-8"))
    checkoutMail.deliver
    
    session[:cart_id] = nil
  end
  
end
