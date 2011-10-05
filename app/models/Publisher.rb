class Publisher

  def initialize(message_complete, slug)
    @message_complete = message_complete
    @url = 'http://demo.promesometro.pe/promesas/' + slug
  end
  
  def publish
    publish_to_twitter
    publish_to_facebook
  end

private

  def twitter_client
    @twitter ||= TwitterOAuth::Client.new(TWITTER_CREDENTIALS)
  end
  
  def facebook_client
    @facebook ||= Koala::Facebook::API.new(FACEBOOK_CREDENTIAL[:token])
  end
  
  def page
    @page ||= Koala::Facebook::API.new(facebook_client.get_connections("me", "accounts").first['access_token'])
  end
  
  def bitly
    @bitly ||= Bitly.new(BITLY_CREDENTIALS[:username], BITLY_CREDENTIALS[:api_key])
  end
  
  def publish_to_facebook
    page.put_wall_post(message)
  end
  
  def publish_to_twitter
    twitter_client.update(message)
  end
  
  def short_url
    bitly.shorten(@url).short_url
  end
  
  def message
    @message = @message_complete[0,110] + '... ' + short_url
  end
end