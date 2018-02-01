class WelcomeController < ApplicationController
  def index
    @bookmarks = Bookmark.limit(10).order("RANDOM()")
  end
end
