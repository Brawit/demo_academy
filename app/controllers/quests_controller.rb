class QuestsController < ApplicationController
  before_action :set_quest, only: %i[ show edit update destroy ]

  # GET /quests
  def index
    @quests = Quest.all
    @quest = Quest.new
  end

  # GET /quests/1
  def show
  end

  # GET /quests/new
  def new
    @quest = Quest.new
  end

  # GET /quests/1/edit
  def edit
  end

  # POST /quests
  def create
    @quest = Quest.new(quest_params)

    respond_to do |format|
      if @quest.save
        format.turbo_stream
        format.html { redirect_to quests_path, notice: "Quest was successfully created." }
        format.json { render :show, status: :created, location: @quest }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "new_quest_form",
            partial: "form",
            locals: { quest: @quest }
          )
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quests/1
  def update
    respond_to do |format|
      if @quest.update(quest_params)
        format.turbo_stream
        format.html { redirect_to quests_path, notice: "Quest was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @quest }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quests/1
  def destroy
    @quest.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to quests_path, notice: "Quest was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    def set_quest
      @quest = Quest.find(params[:id])
    end

    def quest_params
      params.require(:quest).permit(:name, :is_done)
    end
end
