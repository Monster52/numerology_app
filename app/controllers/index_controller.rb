require 'sinatra'

get '/message/:birth_path_num' do
  birth_path_num = params[:birth_path_num]
  @message = Person.get_message(birth_path_num)
  erb :message
end

get '/:birthdate' do
  setup_index_view
  erb :message
end

get '/' do
  erb :form
end

post '/' do
  birthdate = params[:birthdate].gsub("-", "")
  if Person.valid_birthdate(birthdate)
    birth_path_num = Person.get_birthpath(birthdate)
    redirect "/message/#{birth_path_num}"
  else
    @error = "You should enter a valid birthdate in the form of mmddyyyy."
    erb :form
  end
end

def setup_index_view
  birthdate = params[:birthdate]
  birthday = Person.get_birthpath(birthdate)
  @message = Person.get_message(birthday)
end

