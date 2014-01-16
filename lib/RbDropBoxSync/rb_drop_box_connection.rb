require 'dropbox_sdk'
require 'yaml'

class RbDropBoxConnection
  def initialize
    config = YAML.load_file("/home/cemeyer/rbdbsconfig.yaml")
    #flow = DropboxOAuth2FlowNoRedirect.new('asdfasf', 'asdfasfd')
    ##url = flow.start() #need to do something to get code if we deploy this
    ##puts url
    ##return
    ##code = config['code']
    #access_token, user_id = flow.finish('asdfasdf'.strip())
    #puts access_token
    #puts user_id


    @client = DropboxClient.new(config['access_token'].strip())
    puts "linked account ", @client.account_info().inspect
    p @client.media('/')
  end
end