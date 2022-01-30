class StoriesController < ApplicationController
  def index
    @stories = Story.all
    @story = Story.new

    @markers = @stories.geocoded.map do |story|
      {
        lat: story.latitude,
        lng: story.longitude,
        info_window: render_to_string(partial: "info_window", locals: { story: story }),
        image_url: helpers.asset_url("dot.png")
      }
    end
  end

  def create
    @story = Story.new(story_params)
    @story.active = false
    if @story.save
      redirect_to stories_path, notice: "Thank you for submitting your story. 
                                        We will review and post it as soon as we have a chance."
    end
  end

  def story_params
    params.require(:story).permit(:plot, :location, :when)
  end
end
