class QuizController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def answer
    query = params[:question]
    p = Poem.where("content like ?", "%" + "#{query}" + "%").last.title
    respond_to do |format|

      format.json { render :json => {answer: p, token: Token.last.user_token, task_id: params[:id]}}

    end
  end
end