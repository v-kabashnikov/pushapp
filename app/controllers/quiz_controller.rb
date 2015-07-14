class QuizController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def answer
    query = params[:question]
    p = Poem.where("content like ?", "%" + "#{query}" + "%").last.title
    respond_to do |format|

      uri = URI("http://pushkin-contest.ror.by/quiz")
      parameters = {
          answer: p,
          token: Token.last.user_token,
          task_id:  params[:id]
      }
      Net::HTTP.post_form(uri, parameters)
    end
  end
end