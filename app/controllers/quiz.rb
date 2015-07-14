class Quiz < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def quiz
    binding.pry
    query = params[:question]
    p params[:token]
    p Poem.where("content like ?", "%" + "#{query}" + "%").last.title
  end
end