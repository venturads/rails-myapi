require 'rubygems'
require 'httparty'
class UsersController < ApplicationController
    # Use the class methods to get down to business quickly
#response = HTTParty.get('http://api.stackexchange.com/2.2/questions?site=stackoverflow')

  def index
    uri = HTTParty.get"https://rubygems.org/api/v1/search.json?query=c"
    @place = JSON.parse(uri.body)
    
    if params[:search]
      #@usersq = User.search(params[:search]).order("created_at DESC")
      uri = HTTParty.get"https://rubygems.org/api/v1/search.json?query=" + params[:search]
      @place = JSON.parse(uri.body)
    else
      uri = HTTParty.get"https://rubygems.org/api/v1/search.json?query=a"
      @place = JSON.parse(uri.body)
    end
  end
end
