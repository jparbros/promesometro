class HomeController < ApplicationController
  
  def show
    @government = Comment.government.limit(10).order('id DESC')
    @citizens = Comment.citizens_approved.limit(10).order('id DESC')
  end
  
  def facebook
    redirect_to client.url_for_oauth_code
  end
  
  def oauth
    oauth_access_token = client.get_access_token(params[:code])
    render :text => oauth_access_token.inspect
  end
  
  
  def client
    @client ||=  Koala::Facebook::OAuth.new(FACEBOOK_CREDENTIAL[:client_id], FACEBOOK_CREDENTIAL[:secret_id], 'http://demo.promesometro.pe/oauth')
  end
  
end
