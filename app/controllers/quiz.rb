class Quiz < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def quiz
    
  end
end