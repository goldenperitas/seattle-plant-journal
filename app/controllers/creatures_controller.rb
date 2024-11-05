class CreaturesController < ApplicationController
  before_action :set_creature, only: %i[ show edit update destroy ]

  # GET /creatures or /creatures.json
  def index
    @creatures = Creature.all
  end

  # GET /creatures/1 or /creatures/1.json
  def show
    @creature = Creature.includes(:creature_resources).find(params[:id])
    @creature_resources = @creature.creature_resources
    @creature_comments = [] # TODO: temporary
  end

  # GET /creatures/new
  def new
    @creature = Creature.new
  end

  # GET /creatures/1/edit
  def edit
  end

  # POST /creatures or /creatures.json
  def create
    @creature = Creature.new(creature_params)

    if @creature.save
      redirect_to creatures_path, notice: "Creature was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /creatures/1 or /creatures/1.json
  def update
    if @creature.update(creature_params)
      redirect_to @creature, notice: "Creature was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /creatures/1 or /creatures/1.json
  def destroy
    @creature.destroy!
    redirect_to creatures_path, status: :see_other, notice: "Creature was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_creature
    @creature = Creature.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def creature_params
    params.require(:creature).permit(
      :english_name,
      :scientific_name,
      :twulshootseed,
      :description
    )
  end
end
