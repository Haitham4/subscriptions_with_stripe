Stripe.api_key = STRIPE_SECRET

class RecordCharges
   def call(event)
     # Define subscriber behavior based on the event object
     event.class       #=> Stripe::Event
     event.type        #=> "charge.failed"
     event.data.object #=> #<Stripe::Charge:0x3fcb34c115f8>

     charge = event.data.object

     user = User.find_by(stripe_id: charge.customer)
     user.charges.create(
                     stripe_id: charge.id,
                     amount: charge.amount,
                     card_last4: charge.source.last4,
                     card_type: charge.source.brand,
                     card_exp_month: charge.source.exp_month,
                     card_exp_year: charge.source.exp_year
     )
   end
end

StripeEvent.configure do |events|
  events.subscribe 'charge.succeeded', RecordCharges.new
end

