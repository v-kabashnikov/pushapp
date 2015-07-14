class RegistrationController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def register

    respond_to do |format|

      format.json { render :json => {answer: 'снежные'}}
      token = params[:token]
      Token.create(user_token:"#{token}")
    end
  end
end