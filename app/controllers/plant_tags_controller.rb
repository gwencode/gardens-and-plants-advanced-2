class PlantTagsController < ApplicationController

  def new
    @plant_tag = PlantTag.new
    @plant = Plant.find(params[:plant_id])
    # @tags = Tag.all
  end

  def create
    @plant = Plant.find(params[:plant_id])
    # For one tag
    # @tag = Tag.find(params[:plant_tag][:tag])
    # @plant_tag = PlantTag.new(plant: @plant, tag: @tag)
    # if @plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   render :new, status: :unprocessable_entity
    # end

    # For several tags
    tags = Tag.where(id: params[:plant_tag][:tag])
    tags.each do |tag|
      plant_tag = PlantTag.new(plant: @plant, tag: tag)
      unless plant_tag.save
        @plant_tag = PlantTag.new
        render :new, status: :unprocessable_entity
        return
      end
    end
    redirect_to garden_path(@plant.garden)
  end
end
