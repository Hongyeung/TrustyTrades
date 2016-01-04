class BidsController < ApplicationController

  def new
    @job = Job.find params[:job_id]
    @bid = Bid.new
  end

  def create
    bid_params = params.require(:bid).permit(:amount)
    @job = Job.find params[:job_id]
    if @job.user != current_user
      begin
        @bid = Bid.find_or_initialize_by(job_id: @job.id, user_id: current_user.id)
        @bid.update(bid_params)
        @bid.save
      rescue ActiveRecord::RecordNotUnique
        retry
      end
      redirect_to job_path(@job)
    else
      redirect_to new_job_bid_path(@job), notice: "You cannot bid on your own job... silly."
    end
  end

  def edit
    @job = Job.find params([:job_id])
    @bid = Bid.find params[:id]
  end
end
