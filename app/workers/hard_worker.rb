class HardWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(question, level, task_id)
    puts question
    p = Poem.where("content like ?", "%" + question + "%").last.title
    puts "dsds"
    uri = URI("http://pushkin-contest.ror.by/quiz")
    parameters = {
        answer:p ,
        token: Token.last.user_token,
        task_id:  task_id
    }
    Net::HTTP.post_form(uri, parameters)
  end
end