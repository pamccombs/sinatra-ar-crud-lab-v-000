
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    #redirect to "/articles"
  end
  
  get '/articles/new' do
    @article = Article.new
    erb :new
  end
  
  get '/articles' do
    @articles= Articles.all
    erb :index
  end
  
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  get '/articles/:id/edit' do
    erb :edit
  end
  
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end
  
end
