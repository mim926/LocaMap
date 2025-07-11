require "carrierwave/storage/abstract"
require "carrierwave/storage/file"
require "carrierwave/storage/fog"
# ActiveSupport::Deprecation.warnの対応
module ActiveSupport
  class Deprecation
    class << self
      public :warn
    end
  end
end

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = "fog/aws"
  config.fog_directory  = "locamap-images-bucket"
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: "ap-northeast-1",
    path_style: true
  }
  config.fog_attributes = {}
end
