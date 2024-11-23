class CreatureResourcesController < ApplicationController
  before_action :set_creature_resource, only: %i[ show edit update destroy ]

  # GET /creature_resources or /creature_resources.json
  def index
    @creature_resources = CreatureResource.all
  end

  # GET /creature_resources/1 or /creature_resources/1.json
  def show
  end

  # GET /creature_resources/new
  def new
    @creature_resource = CreatureResource.new
  end

  # GET /creature_resources/1/edit
  def edit
  end

  # POST /creature_resources or /creature_resources.json
  def create
    @creature_resource = CreatureResource.new(creature_resource_params)

    if @creature_resource.save
      return_path = params[:creature_resource][:return_path].presence || @creature_resource
      redirect_to return_path, notice: "Creature resource was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /creature_resources/1 or /creature_resources/1.json
  def update
    if @creature_resource.update(creature_resource_params)
      redirect_to @creature_resource, notice: "Creature resource was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /creature_resources/1 or /creature_resources/1.json
  def destroy
    @creature_resource.destroy!
    redirect_to creature_resources_path, status: :see_other, notice: "Creature resource was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_creature_resource
    @creature_resource = CreatureResource.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def creature_resource_params
    params.require(:creature_resource).permit(
      :creature_id,
      :resource_type,
      :url,
      :title,
      :description,
      tag_ids: []
    )
  end
end
