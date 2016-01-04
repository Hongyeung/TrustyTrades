class GeneralReviewsController < ApplicationController

before_action :set_general_review, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find params[:user_id]
    @reviews_on_user = @user.inverse_general_reviews
  end

  def show
  end

  def new
    @general_review = GeneralReview.new
  end

  def edit
  end

  def create
    @general_review = GeneralReview.new(general_review_params)
    @user = User.find params[:user_id]
    @general_review.reviewer = current_user
    @general_review.reviewee = @user
    if current_user != @user
      if @general_review.save
        redirect_to dashboard_user_path(@user), notice: 'General review was successfully created.'
      else
        redirect_to dashboard_user_path(@user), alert: 'Cannot review same company more than once.'
      end
    else
      redirect_to dashboard_user_path(@user), notice: 'You cannot review your own company.'
    end
  end

  def update
    respond_to do |format|
      if @general_review.update(general_review_params)
        format.html { redirect_to @general_review, notice: 'General review was successfully updated.' }
        format.json { render :show, status: :ok, location: @general_review }
      else
        format.html { render :edit }
        format.json { render json: @general_review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @general_review.destroy
    respond_to do |format|
      format.html { redirect_to general_reviews_url, notice: 'General review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_general_review
      @general_review = GeneralReview.find(params[:id])
    end

    def general_review_params
      params.require(:general_review).permit(:rating, :name, :body)
    end
end
