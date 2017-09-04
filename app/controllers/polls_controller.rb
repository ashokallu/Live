class PollsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_poll, :only => [:show, :edit, :update, :destroy ]
  
  def index
    @polls = Poll.all.order('id ASC')
  end

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    if @poll.save
      respond_to do |format|
        # format.html { redirect_to @poll, notice: "Poll Successfully Created" }
        format.html { redirect_to new_vote_path, notice: "Poll Successfully Created" }
        format.json { render json: @poll }
        format.js
      end
    else
      respond_to do |format| 
        format.html { render action: 'new' }
        format.json { render :json => { errors: @poll.errors.full_messages, status: 404} }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json {render json: @poll.options.pluck(:votes_count)}
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  private

  def poll_params
    params.require(:poll).permit(:title, options_attributes: [:title])
  end

  def set_poll
    @poll = Poll.find(params[:id])
  end

end

