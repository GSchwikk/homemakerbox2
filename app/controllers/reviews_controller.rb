class ReviewsController < ApplicationController

  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_builder
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  def check_user
    unless @review.user == current_user || (current_user.admin?)
      redirect_to root_url, alert: "Sorry, this review belongs to someone else"
    end
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.builder_id = @builder.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to @builder, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to redirect_to builder_path(@builder), notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to builder_path(@builder), notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
      def set_builder
        @builder = Builder.find(params[:builder_id])
      end

    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
