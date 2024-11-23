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
    @related_species = Creature.where.not(id: @creature.id).limit(3) # TODO: temporary
    @creature_comments = [] # TODO: temporary

    # URLs for social sharing
    url = request.original_url
    content = "Learn about #{@creature.english_name} on Seattle Plant Journal!"
    @twitter_url = "https://twitter.com/intent/tweet?url=#{url}&text=#{content}&hashtags=seattleplantjournal,plants,seattle"
    @facebook_url = "https://www.facebook.com/sharer/sharer.php?u=#{url}"
    @mailto_url = "mailto:?subject=Check out this plant on Seattle Plant Journal!&body=#{url}"
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
      :other_english_names,
      :scientific_name,
      :twulshootseed,
      :toxic_status,
      :description,
      :featured_image,
      additional_images: []
    )
  end
end
