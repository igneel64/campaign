module UsersHelper

  def getdata(data)
    date=''
    page=1
    page_size=100
    order_field='email'
    order_direction='asc'
    auth={:password=>'x', :username=>ENV["cs_key"]}
    @blah = HTTParty.get("https://api.createsend.com/api/v3.1/lists/#{ENV["cs_list_id"]}/active.json?date=#{date}&page=#{page}&pagesize=#{page_size}&orderfield=#{order_field}&orderdirection=#{order_direction}", 
                     :basic_auth => auth, :verify => false).as_json
    @ready= JSON.parse( @blah.to_json, {:symbolize_names => true} )
    data=@ready[:Results]
  end

end
