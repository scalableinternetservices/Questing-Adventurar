class PendingsController < ApplicationController
  before_action :set_pending, only: [:show, :edit, :update, :destroy]

  # GET /pendings
  # GET /pendings.json
  def index
    @pendings = Pending.all
  end

  # GET /pendings/1
  # GET /pendings/1.json
  def show
  end

  # GET /pendings/new
  def new
    @pending = Pending.new
  end

  # GET /pendings/1/edit
  def edit
  end

  # POST /pendings
  # POST /pendings.json
  def create
    @pending = Pending.new(pending_params)

    respond_to do |format|
      if @pending.save
        format.html { redirect_to :back, notice: 'Pending was successfully created.' }
        format.json { render :show, status: :created, location: @pending }
      else
        format.html { render :new }
        format.json { render json: @pending.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pendings/1
  # PATCH/PUT /pendings/1.json
  def update
    respond_to do |format|
      if @pending.update(pending_params)
        format.html { redirect_to @pending, notice: 'Pending was successfully updated.' }
        format.json { render :show, status: :ok, location: @pending }
      else
        format.html { render :edit }
        format.json { render json: @pending.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pendings/1
  # DELETE /pendings/1.json
  def destroy
    @pending.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Pending was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pending
      @pending = Pending.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pending_params
      params.require(:pending).permit(:quest_id, :user_id)
    end
end
