require 'spec_helper'

describe Spree::Order do

  before(:each) do
    @store = FactoryGirl.create(:store)
  end

  it 'should correctly find products by store' do
    @order = FactoryGirl.create(:order, :store => @store)
    @order2 = FactoryGirl.create(:order)

    by_store = Spree::Order.by_store(@store)

    by_store.should include(@order)
    by_store.should_not include(@order2)
  end

  it 'should associate an unreturned exchange order with the store of the original order' do
    order = FactoryGirl.create(:shipped_order, line_items_count: 1, store: @store)
    order.create_order_for_unreturned_exchange!.store_id.should == order.store_id
  end
end
