Rails.application.config.middleware.use OmniAuth::Builder do
  provider "createsend", ENV["cs_id"], ENV["cs_key"], :scope => "ViewReports,CreateCampaigns,SendCampaigns,ImportSubscribers"
end