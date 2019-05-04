require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'faker'

require_relative '../services/user_service.rb'

RSpec.configure do |config|
  include UserService
  config.color = true
  config.formatter = :documentation
end
