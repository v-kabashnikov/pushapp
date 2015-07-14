class QuizController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def answer

    respond_to do |format|
      HardWorker.perform_async(params[:question],params[:level],params[:id])
      render :nothing => true, :status => 200, :content_type => application/json
    end
  end
end