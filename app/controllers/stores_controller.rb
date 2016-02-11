class StoresController < ApplicationController

  # GET /stores
  def index
    @stores = Store.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /stores/1
  def show
    @store = Store.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /stores/new
  def new
    @store = Store.new

    respond_to do |format|
      format.js
    end
  end

  # GET /stores/1/edit
  def edit
    @store = Store.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # POST /stores
  def create
    @store = Store.new(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to @store, notice: 'Store was successfully created.' }
        format.js
      else
        format.html { redirect_to stores_url }
        format.js {
          render js: %Q{alert("#{@store.errors.full_messages.to_sentence}");}
        }
      end
    end
  end

  # PUT /stores/1
  def update
    @store = Store.find(params[:id])

    respond_to do |format|
      if @store.update_attributes(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js {
          render js: %Q{alert("#{@store.errors.full_messages.to_sentence}");}
        }
      end
    end
  end

  # DELETE /stores/1
  def destroy
    @store = Store.find(params[:id])
    @store.destroy

    respond_to do |format|
      format.html { redirect_to stores_url }
      format.js
    end
  end

  def send_admin_email
    if params[:store_id]
      store = Store.find(params[:store_id])
      store.send_admin_email
    end

    respond_to do |format|
      format.html { redirect_to stores_url }
        format.js {
          render js: "alert('Email sent.');"
        }
    end
  end

  private

  def store_params
    params.require(:store).permit(:location_name, :company_id)
  end
end
