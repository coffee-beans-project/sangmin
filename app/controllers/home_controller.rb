class HomeController < ApplicationController
  def index
    unless user_signed_in?
    redirect_to '/users/sign_in'
    end
    @search_keyword = params[:search_bar]
    @cafes = Cafe.where("name Like ? OR region Like ?", "%#{@search_keyword}%", "%#{@search_keyword}%")
    
  
  end
  def search
    @search_keyword = params[:search_bar]
    outlet = Cafe.where(overnight: to_boolean(params[:overnight]), outlet: to_boolean(params[:outlet]))
    # outlet = Cafe.all
    # redirect_to '/home/index'
    
    render :json => {
      :cafes => outlet
    }
  end
  
  def map
    
  end
  
  def search_bar
   
  end
  
  def to_boolean(str)
    str == 'true'
  end
  
  def mypage

  end
  def email
    @title=params[:title]
    @address=params[:address]
    @content=params[:content]
        
      mg_client = Mailgun::Client.new("key-db3c1e54124ed4e823f8a3ecc3fdba29")

      message_params = {
        from: 'ksm3725@naver.com',
        to: @address,
        subject: @title,
        text: @content
      }

      result = mg_client.send_message('sandbox787f016c83674e2182979f1a2978b123.mailgun.org', message_params).to_h!
      logger.info
      message_id = result['id']
      message = result['message']
      
      new_post = Post.new
      new_post.title = @title
      new_post.address = @address
      new_post.content = @content
      new_post.save
        
      redirect_to "/mypage"

  end
end
