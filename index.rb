require 'dotenv'
Dotenv.load

USER_GMAIL = ENV['USER_GMAIL']
PASSWORD_GMAIL = ENV['PASSWORD_GMAIL']
CONSUMER_KEY = ENV['CONSUMER_KEY']
CONSUMER_SECRET = ENV['CONSUMER_SECRET']
ACCESS_TOKEN  = ENV['ACCESS_TOKEN']
ACCESS_TOKEN_SECRET = ENV['ACCESS_TOKEN_SECRET']

require_relative './scrapper/townhalls_scrapper'
require_relative './mailer/townhalls_mailer'
require_relative './twitter/townhalls_twitter'



save_to_json
go_through_all_line
follow_user 