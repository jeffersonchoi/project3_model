require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(30.seconds, 'Update the Bus') {
   # Heroku::API.new.post_ps('pocket-pal', 'rake scheduler:send_notifications')
    'rake busapi:update'
}
