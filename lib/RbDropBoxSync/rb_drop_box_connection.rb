require 'dropbox_sdk'

class RbDropBoxConnection
  def initialize
    #flow = DropboxOAuth2FlowNoRedirect.new('asdfasf', 'asdfasfd')
    ##url = flow.start() #need to do something to get code if we deploy this
    ##puts url
    ##return
    ##code = config['code']
    #access_token, user_id = flow.finish('asdfasdf'.strip())
    #puts access_token
    #puts user_id


    @client = DropboxClient.new(RbDropBoxSync.get_config 'access_token')
    puts "linked account ", @client.account_info().inspect
    p @client.metadata('/')
  end
end