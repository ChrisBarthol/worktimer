class CustomersController < ApplicationController
	require 'csv'

  def show
    @customer = Customer.find(params[:id])
  end

  def new
  	@customer = Customer.new
  end

  def create
  	@customer = Customer.new(customer_params)
	    if @customer.save
	      flash[:success] = "Added a New Customer!"
	      redirect_to @customer
	    else
	      render 'new'
	    end
  end

  def index
  	@customers = Customer.paginate(page: params[:page])
  end

  def import
    Customer.import(params[:file])
    redirect_to root_url, notice: "Customers imported."
  end

  private

	    def customer_params
	      params.require(:customer).permit(:company, :address1, :address2, :address3, :city, :state, :zip, :phone1, :phone2, :fax1, :fax2, :email, :website)
	    end
end