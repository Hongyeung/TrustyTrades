class JobsController < ApplicationController

  def new
    @job  = Job.new
    @user = User.find params[:user_id]
  end

  def create
    # @job = Job.new job_params
    # @job.user = current_user
    @job = current_user.jobs.build(job_params)
    if @job.save
      redirect_to user_job_path(current_user, @job), notice: "Job Created Successfully!"
    else
      render :new
    end
  end

  def show
    @job = Job.find params[:id]
    @bid_display = @job.bids.order(amount: :desc).first(3)
    @job_tags = @job.tags
    @users_sorted_by_avg = @job.related_users.sort_by {|user| user.average_general_reviews}
    @bids = current_user.bids.where(job_id: @job.id)
  end

  def index
    @user = User.find params[:user_id]
    @related_jobs_to_user = @user.related_jobs
  end

  def owner_jobs
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def job_params
      params.require(:job).permit(:address, :budget, :name, :description, :end_date, {tag_ids: []})
    end

end
