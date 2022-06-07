class PostsController < ApplicationController
  def index
    @posts = Post.all.order('updated_at DESC')
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to user_posts_path, notice: "Post was successfully created."
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path, alert: "Post was successfully destroyed."
  end

  private
  def post_params
    params.require(:post).permit(:body, images: [])
  end
end
