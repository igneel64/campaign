Rails.application.config.middleware.use OmniAuth::Builder do
  provider "createsend", ENV['8c24cb9424715ee7c7204165545e486c'], ENV['8b5b621996e34dd3e919bfb31499e590'], :scope => "ViewReports,CreateCampaigns,SendCampaigns,ImportSubscribers"
end