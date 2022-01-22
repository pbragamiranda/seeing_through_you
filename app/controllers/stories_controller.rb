class StoriesController < ApplicationController
  def index
    @stories = Story.all

    @markers = @stories.geocoded.map do |story|
      {
        lat: story.latitude,
        lng: story.longitude,
        info_window: render_to_string(partial: "info_window", locals: { story: story })
      }
    end
  end
end
