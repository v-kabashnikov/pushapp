class HardWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false

  def perform(question, level, task_id)
    binding.pry
    titles = Poem.where("content LIKE :query", query: "%#{question.strip}%").select(:title)
    p = titles.first.title
    uri = URI("http://pushkin-contest.ror.by/quiz")
    parameters = {
        answer:p ,
        token: Token.last.user_token,
        task_id:  task_id
    }
    puts parameters.to_s.magenta
    r = Net::HTTP.post_form(uri, parameters)
    p r.to_s.red
  end
end





  