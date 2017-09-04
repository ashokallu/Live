class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_poll

  after_action :send_json, only: [:create]

  def new
    @vote = current_user.votes.new
    @options = {}
    @i = 0
    @poll.options.order('id ASC').each do |opt|
      @options[opt.id] = opt.title
    end
  end

  def data
    respond_to do |format|
      format.json { render json: @poll.options.order('id ASC').pluck('votes_count') }
    end
  end

  def create
    @vote = current_user.votes.build(option_id: vote_params[:option], poll_id: @poll.id)
    if @vote.save
      # Redis.current.publish('vote.create', @poll.options.order('id ASC').pluck(:votes_count).to_json)
      respond_to do |format|
        format.html {redirect_to poll_path(@vote.option.poll), notice: 'voted successfully'}
        format.json {render json: @vote}
      end
    else
      respond_to do |format|
        format.html {render "new"}
        format.json {render json: @vote.errors}
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:option)
  end

  def set_poll
    @poll = Poll.where('status = ?', 1).last
  end

  def send_json
    total = []
    total << @poll.options.order('id ASC').pluck('votes_count')
    Redis.current.publish('vote.create', total)
  end
end
