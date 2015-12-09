class JobsController < ApplicationController

  def new
    @job  = Job.new
    @user = User.find params[:user_id]
  end

  def create
    @job = Job.new job_params
    @user = User.find params[:user_id]
    @job.user = @user
    if @job.save
      redirect_to user_job_path(@user, @job), notice: "Job Created Successfully!"
    else
      render :new
    end
  end

  def show
    @job = Job.find params[:id]
    @user = User.find params[:user_id]
    @job_tags = @job.tags
    @job_tags_contractor = @job.tags
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def job_params
      params.require(:job).permit(:budget, :name, :description, :end_date, {tag_ids: []})
    end

end
