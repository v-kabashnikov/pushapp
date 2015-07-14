class Quiz < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def quiz
    p params[:question]
  end
end