class Charge < ApplicationRecord
DEFAULT_CURRENCY = 'usd'.freeze
  def initialize(params, user)
    @@stripe_email = params[:stripeEmail]
    @stripe_token = params[:stripeToken]
    @order = params[:order_id]
    @user = user

  end

  def call(item_price)
    create_charge(find_customer,item_price)
  end

  private

  attr_accessor :user, :stripe_email, :stripe_token, :order

  def find_customer
  	begin
		  if stripe_token
		    retrieve_customer(stripe_token)
			byebug
		  else
		  	byebug
		    create_customer
		  end
	rescue 
  end
end
	  def retrieve_customer(stripe_token)
	    Stripe::Customer.retrieve(stripe_token) 
	  end

	  def create_customer
	    customer = Stripe::Customer.create(
	      email: stripe_email,
	      source: stripe_token
	    )
	    user.update(stripe_token: customer.id)
	    customer
	  end

	  def create_charge(customer,item_price)

	    Stripe::Charge.create(
	      customer: user.id,
	      amount: item_price,

	      description: customer.email,
	      currency: DEFAULT_CURRENCY
	    )
	  end

	
end
