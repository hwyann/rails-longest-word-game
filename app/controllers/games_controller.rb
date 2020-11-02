require 'JSON'
require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = ("A".."Z").to_a.sample(8)
  end

  def score
    @word_array = params[:word].upcase.split("").sort
    @letter_array = params[:letters].split(" ").sort
    @check = @word_array & @letter_array
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    @dictionary = JSON.parse(open(url).read)
    @score = params[:word].length
    @grand_score = 0
    @grand_score += @score
  end
end
