require 'sinatra/base'
require './persistable.rb'
require './student.rb'

require 'sqlite3'



# Why is it a good idea to wrap our App class in a module?
module StudentSite
  class App < Sinatra::Base
     get '/' do
       "hello world!"
     end

    get '/hello-world' do
      @random_numbers = (1..20).to_a
      erb :hello
      # @random_numbers = [1..20]
      end
     
    get '/artist' do
        @snoop = "Snoop Dog"
        @aphex = "Aphex twin"
        @jackwhite =  "Jack White"
        @array = [@snoop, @aphex, @jackwhite]
        erb :artist
    end

    get '/students' do
        @students = Student.all
        
        erb :student
    end
    # @students = Student.all  
    # @students.each do |path|
    #    link = path.gsub(" ", "-")
    #   get '/#{link}' do
    #     File.open("#{link}.txt", 'w') {|f| f.write("<h1>!!!!</h1>") }

    #     erb link.to_symbol
    #   end
    # end

    
      get '/students/:id' do
        @student = Student.find(params[:id])
        @individual = Student.all
        erb :individual
      end

        

    # get '/students' do 
    #   @students = Student.all
    #     erb (student.name).to_symbol

    # end


 



  end
end