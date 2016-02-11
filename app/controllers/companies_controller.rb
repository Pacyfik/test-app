class CompaniesController < ApplicationController

  # GET /companies
  def index
    @companies = Company.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /companies/1
  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /companies/new
  def new
    @company = Company.new

    respond_to do |format|
      format.js
    end
  end

  def new_store
    @company = Company.find(params[:company_id])

    respond_to do |format|
      format.js
    end
  end

  # GET /companies/1/edit
  def edit
    @company = Company.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.js
      else
        format.html { redirect_to companies_url }
        format.js {
          render js: %Q{alert("#{@company.errors.full_messages.to_sentence}");}
        }
      end
    end
  end

  # PUT /companies/1
  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js {
          render js: %Q{alert("#{@company.errors.full_messages.to_sentence}");}
        }
      end
    end
  end

  # DELETE /companies/1
  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.js
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, stores_attributes: [:location_name])
  end
end
