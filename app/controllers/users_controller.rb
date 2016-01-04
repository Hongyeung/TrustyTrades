class UsersController < ApplicationController

before_action :authenticate_user, only: [:dashboard, :owner_dashboard]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      if @user.contractor
        redirect_to dashboard_user_path(@user), notice: "account created!"
      else
        redirect_to owner_dashboard_user_path(@user), notice: "account created!"
      end
    else
      render :new
    end
  end

  def dashboard
    @user = User.find params[:id]
    @general_review = GeneralReview.new
    @reviewers = @user.reviewers
    @reviews = @user.inverse_general_reviews.limit(3).order(rating: :desc)
    @average_rating = @user.average_general_reviews
    @related_jobs_to_user = @user.related_jobs
    @related_jobs_to_user_display = @user.related_jobs.order(budget: :desc).first(3)

    if @user == current_user && @user.is_a_contractor?
      render :contractor_dashboard
    else
      render :dashboard
    end
  end

  def owner_dashboard
    @user = User.find params[:id]
    @related_jobs_display = @user.jobs.order(budget: :desc).first(3)

    if params[:search].present?
      @users = User.search(params[:search])
      @users_sorted_by_avg = @users.sort_by {|user| user.average_general_reviews}.reverse
    end
  end

  def owner_jobs
    @user = User.find params[:id]
  end

  def bidded_jobs
    @user = User.find params[:id]
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if current_user == @user
      if @user.update user_params
        redirect_to dashboard_user_path(@user), notice: "Account updated!"
      else
        redirect_to root_path, notice: "Couldn't update your account!"
      end
    else
      redirect_to dashboard_user_path(@user), alert: "You can only edit your own account!"
    end
  end

  def destroy
  end

  private

  def user_params
    user_params = params.require(:user).permit(:company_name, :address, :avatar,
                                               :image_one, :image_two, :image_three,
                                               :contractor, :first_name, :last_name,
                                               :email, :phone_number, :password,
                                               {tag_ids: []}, :password_confirmation)
  end


end
