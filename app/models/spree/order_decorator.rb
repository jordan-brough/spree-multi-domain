Spree::Order.class_eval do
  belongs_to :store
  scope :by_store, lambda { |store| where(:store_id => store.id) }

  def available_payment_methods
    @available_payment_methods ||= Spree::PaymentMethod.available(:front_end, store)
  end

  def create_order_for_unreturned_exchange_with_store!
    order = self.create_order_for_unreturned_exchange_without_store!

    # grab the store ID from the original order
    order.update_attribute(:store_id, self.store_id)

    order
  end
  alias_method_chain :create_order_for_unreturned_exchange!, :store
end
