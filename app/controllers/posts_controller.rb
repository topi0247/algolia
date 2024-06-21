class PostsController < ApplicationController
  def index
    post = Post.search('caption31', { hitsPerPage: 5, page: 2 })
    render json: { posts: post }
  end
end
