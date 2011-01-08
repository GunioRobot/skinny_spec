# Let's make sure everyone else is loaded
require Rails.root.join('config', 'environment')
require 'rspec/rails'

begin
  require 'ruby2ruby'
rescue LoadError
  puts "-----"
  puts "Attention: skinny_spec requires ruby2ruby for nicer route descriptions"
  puts "It is highly recommended that you install it: sudo gem install ruby2ruby"
  puts "-----"
end

# Let's load our family now
require "lucky_sneaks/common_spec_helpers"
require "lucky_sneaks/controller_request_helpers"
require "lucky_sneaks/controller_spec_helpers"
require "lucky_sneaks/controller_stub_helpers"
require "lucky_sneaks/model_spec_helpers"
require "lucky_sneaks/view_spec_helpers"

# Let's all come together
RSpec.configure do |config|
  config.include LuckySneaks::ControllerSpecHelpers, :type => :controller
  config.include LuckySneaks::ModelSpecHelpers, :type => :model
  config.include LuckySneaks::ViewSpecHelpers, :type => :view
  config.include LuckySneaks::CommonSpecHelpers, :type => :helper
end
