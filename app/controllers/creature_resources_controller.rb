class CreatureResourcesController < ApplicationController
  before_action :set_creature_resource, only: %i[ show edit update destroy ]

  # GET /creature_resources or /creature_resources.json
  def index
    @creature_resources = CreatureResource.order(:creature_id)
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

    # Set the order to the last among the creature's resources
    creature = @creature_resource.creature
    @creature_resource.order = creature.creature_resources.maximum(:order).to_i + 1

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
    return_path = request.referer.presence || creature_resources_path
    redirect_to return_path, status: :see_other, notice: "Creature resource was successfully destroyed."
  end

  # PATCH /creature_resources/shift_order
  def shift_order
    creature_resource = CreatureResource.find(params[:id])
    creature = creature_resource.creature
    direction = params[:direction]

    resources = creature.creature_resources.order(:order).to_a
    index = resources.index(creature_resource)

    if direction == "up"
      unless index.zero?
        resources[index], resources[index - 1] = resources[index - 1], resources[index]
        resources.each_with_index do |resource, i|
          resource.update!(order: i)
        end
      end
    else # direction == "down"
      unless index == resources.length - 1
        resources[index], resources[index + 1] = resources[index + 1], resources[index]
        resources.each_with_index do |resource, i|
          resource.update!(order: i)
        end
      end
    end

    @creature_resources = creature.creature_resources.order(:order)
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
      :order,
      tag_ids: []
    )
  end
end
