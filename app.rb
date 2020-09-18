require 'sinatra'
require './lib/birthday.rb'

class BirthdayGreeter < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/details' do
    $person = Birthday.new(params[:name], params[:birthday])
    if $person.birthday?
      erb(:details)
    else 
      erb(:not_your_birthday)
    end
  end
end