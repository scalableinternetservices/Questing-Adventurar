class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new(params.require(:param).permit(:quest_id, :questgiver_id, :adventurer_id))
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @quest = @review.quest

    @review.questgiver = @quest.questgiver
    @review.adventurer = @quest.adventurer

    #update adventurer rating
    @adventurer_profile = @review.adventurer.profile
    @adventurer_current_rating = @adventurer_profile.adventurer_rating
    @adventurer_total_ratings = @adventurer_profile.num_adventurer_ratings

    #take average of previous ratings with current rating
    @adventurer_profile.adventurer_rating = (@adventurer_profile.adventurer_rating*@adventurer_profile.num_adventurer_ratings+@review.rating)/(@adventurer_profile.num_adventurer_ratings+1).to_f

    @adventurer_profile.num_adventurer_ratings = @adventurer_profile.num_adventurer_ratings+1

    @quest.status = 3

    # verify that review doesnt already exist
    @duplicate_review = Review.find_by quest_id: @review.quest_id

    respond_to do |format|
      if @duplicate_review != nil
        format.html {
          redirect_to root_path, notice: 'You already submitted a review for this quest!'
        }
        format.json { render json: @pending.errors, status: :unprocessable_entity }
      elsif @review.save
        @adventurer_profile.save!
        @quest.save!;
        @review.create_activity :create, owner: current_user, recipient: @review.adventurer
        format.html {
          redirect_to root_path, notice: 'Review was successfully created.'
        }
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
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
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
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :quest_id, :questgiver_id, :adventurer_id, :comment, :post_time)
    end
end
