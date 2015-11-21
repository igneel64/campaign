require 'createsend'
module Monitored
  extend ActiveSupport::Concern

  included do
    after_create :add_new_subscriber_to_list
    before_destroy :remove_subscriber_from_list
  end

  def add_new_subscriber_to_list
      cs = CreateSend::Client.new({:api_key=>'8b5b621996e34dd3e919bfb31499e590'},'8c24cb9424715ee7c7204165545e486c')
      
     list_id = 'b99c3718609f2c545912b7d1ea7b12d6'
     CreateSend::Subscriber.add({:api_key=>'8b5b621996e34dd3e919bfb31499e590'},list_id, self.email, self.name, nil, false)
  end

 def remove_subscriber_from_list
  cs = CreateSend::Client.new({:api_key=>'8b5b621996e34dd3e919bfb31499e590'},'8c24cb9424715ee7c7204165545e486c')
  lists = cs.lists_for_email(self.email)
  list_id = 'b99c3718609f2c545912b7d1ea7b12d6'
  CreateSend::Subscriber.new({:api_key=>'8b5b621996e34dd3e919bfb31499e590'},list_id,self.email).unsubscribe
 end

end
  
