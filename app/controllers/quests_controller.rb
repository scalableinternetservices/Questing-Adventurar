class QuestsController < ApplicationController
  before_action :set_quest, only: [:show, :edit, :update, :destroy, :accept, :complete]
  before_filter :authenticate_user!

  # GET /quests
  # GET /quests.json
  def index
    if params[:q] and params[:q][:title_or_description_cont_any]
      params[:q][:title_or_description_cont_any] = params[:q][:title_or_description_cont_any].split(" ")
    end

    @search = Quest.search(params[:q])
    @quests = @search.result.paginate(per_page: 5, page: params[:page]).where(adventurer: nil, status: 0).where.not(questgiver: current_user)

    if params[:within].present? && (params[:within].to_i > 0)
      # Location
      @nearby_users = current_user.profile.nearbys(params[:within]).select(:user_id).map(&:user_id)
      @quests = @quests.where(questgiver: @nearby_users)
    end
    
    if params[:tag]
      # Tag
      @quests = @quests.tagged_with(params[:tag]).where(adventurer: nil)
    end
  end

  # GET /quests/1
  # GET /quests/1.json
  def show
  end

  # GET /quests/new
  def new
    @quest = Quest.new
  end

  # GET /quests/1/edit
  def edit
  end
  
  # POST /quests/accept
  def accept
    Pending.delete_all(quest_id: @quest.id)
    if params[:adventurer]
      @quest.adventurer = User.find(params[:adventurer])
    else
      @quest.adventurer = current_user # Tsung testing.
    end

    @quest.create_activity :accept, owner: current_user, recipient: @quest.adventurer
    @quest.accepted!
    @quest.save!

    redirect_to :back, notice: 'Pending adventurer accepted!'
  end

  # POST /quests/complete
  def complete
    puts "I'm currently working with #{@quest}"
    @quest.create_activity :complete, owner: current_user, recipient: @quest.questgiver
    if params[:s] == "true"
      @quest.complete!
    elsif params[:s] == "false"
      @quest.failure!
    end

    @quest.save!
    redirect_to :back, notice: 'Quest completed!'
  end

  # POST /quests
  # POST /quests.json
  def create
    @quest = Quest.new(quest_params)
    @quest.questgiver = current_user
    respond_to do |format|
      if @quest.save
        # @quest.create_activity :create, owner: current_user, recipient: @quest.questgiver
        format.html { redirect_to @quest, notice: 'Quest was successfully created.' }
        format.json { render :show, status: :created, location: @quest }
      else
        format.html { render :new }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /quests/1
  # PATCH/PUT /quests/1.json
  def update
    respond_to do |format|
      if @quest.update(quest_params)
        if @quest.adventurer # let the adventurer know the quest has been updated
          @quest.create_activity :update, owner: current_user, recipient: @quest.adventurer
        end
          format.html { redirect_to @quest, notice: 'Quest was successfully updated.' }
          format.json { render :show, status: :ok, location: @quest }
      else
        format.html { render :edit }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1
  # DELETE /quests/1.json
  def destroy
    @quest.destroy
    # @quest.create_activity :destroy, owner: current_user
    respond_to do |format|
      format.html { redirect_to quests_url, notice: 'Quest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest
      @quest = Quest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_params
      params.require(:quest).permit(:questgiver_id, :adventurer_id, :title, :price, :description, :post_time, :expiration_time, :tag_list)
    end
end
