class CardsController < ApplicationController
	def index

	@cards = current_user.cards

	end

	def new
		@card = Card.new
		
	end

	def create
	
		@card_no = params[:card_no]
	    @stripe_token = params[:stripeToken]
	    @expiration_month = params[:expiration_month] 
	    @expiration_year = params[:expiration_year] 
		@user_id = current_user.id

		customer = Stripe::Customer.create(email: current_user.email, source: @stripe_token )
			# //params for entering into stripe account and in token id there is customer id generaed by stripe


		@expiry_month = customer.sources[:data][0][:exp_month]
		@expiry_year  = customer.sources[:data][0][:exp_year]
		@card_no_last = customer.sources[:data][0][:last4]

		@card = Card.new(user_id: @user_id, card_no: @card_no_last, expiration_year: @expiry_year, expiration_month: @expiry_month, Token: customer.id)
			if @card.save


			redirect_to cards_path

			 else
			
			 render 'index'
			end
	end
	def createcharge
		
		@card = Card.find(params[:id])
		@customer_id = @card.Token
		@order_id = session[:order_id]
		@order  = Order.find(@order_id)
		@total_price = @order.products.map(&:price).sum
		

		charge = Stripe::Charge.create(
    customer: @customer_id,
    amount: @total_price,
    
    currency: 'usd'

  )
		session[:order_id] = nil
		
		@order.update(status: "complete")

		
	end
	private
	 	def secure_params
	 		# not using it
	 	    params.require(:card).permit(:card_no, :token, :expiration_month ,:expiration_date ,:user_id)
		
		end
	
end
