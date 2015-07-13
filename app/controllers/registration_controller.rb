class RegistrationController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def register
    respond_to do |format|
      format.json { render :json => {answer: 'мглою'}}
    end
  end
end