class UsersController < ApplicationController

before_action :authenticate_user, only: [:dashboard, :owner_dashboard]

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email,
                                               :phone_number, :password, {tag_ids: []}, :password_confirmation)
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_user_path(@user), notice: "account created!"
    else
      render :new
    end
  end

  def dashboard
    @user = User.find params[:id]
    @general_review = GeneralReview.new
    @reviewers = @user.reviewers
    @reviews = @user.inverse_general_reviews.limit(3).order(rating: :desc)

    ratings = []
    @reviews.each do |review|
      ratings << review.rating
    end

    rating_sum = 0
    ratings.each do |rating|
      rating_sum = rating_sum + rating
    end

    if ratings.length == 0
      @average_rating = 0
    else
      @average_rating = (rating_sum.to_f / ratings.length).to_f
    end

  end

  def owner_dashboard
    @user = User.find params[:id]

    if params[:search].present?
      @users = User.search(params[:search])
    end

  end


end
