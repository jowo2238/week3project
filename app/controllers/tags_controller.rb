class TagsController < ApplicationController
  @tag = Tag.find(params[:id])
end
