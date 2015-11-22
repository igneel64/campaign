require 'createsend'
module Monitored
  extend ActiveSupport::Concern

  included do
    after_create :add_new_subscriber_to_list
    before_destroy :remove_subscriber_from_list
  end

  def add_new_subscriber_to_list
    cs = CreateSend::Client.new({:api_key=> ENV["cs_key"]}, ENV["cs_id"])
      
     
    CreateSend::Subscriber.add({:api_key=>ENV["cs_key"]},ENV["cs_list_id"], self.email, self.name, nil, false)
  end

 def remove_subscriber_from_list
  cs = CreateSend::Client.new({:api_key=>ENV["cs_key"]},ENV["cs_id"])
  
  CreateSend::Subscriber.new({:api_key=>ENV["cs_key"]},ENV["cs_list_id"],self.email).unsubscribe
 end

end
  
