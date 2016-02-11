class EmployeesController < ApplicationController

  # GET /employees
  def index
    @employees = Employee.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /employees/1
  def show
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /employees/new
  def new
    @employee = Employee.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /employees/1/edit
  def edit
    @employee = Employee.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # POST /employees
  def create
    @employee = Employee.new(employee_params)
    if params[:store_ids]
      params[:store_ids].each do |id|
        store = Store.find(id.to_i)
        @employee.stores << store
      end
    end

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
        format.js {
          render js: %Q{alert("#{@employee.errors.full_messages.to_sentence}");}
        }
      end
    end
  end

  # PUT /employees/1
  def update
    @employee = Employee.find(params[:id])
    @employee.stores.clear
    if params[:store_ids]
      params[:store_ids].each do |id|
        store = Store.find(id.to_i)
        @employee.stores << store
      end
    end

    respond_to do |format|
      if @employee.update_attributes(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js {
          render js: %Q{alert("#{@employee.errors.full_messages.to_sentence}");}
        }
      end
    end
  end

  # DELETE /employees/1
  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.js
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:email, :first_name, :last_name)
  end
end
