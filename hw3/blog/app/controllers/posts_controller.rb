class PostsController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @post = @user.posts.create(post_params)
        redirect_to user_path(@user)
    end

    def index
        @user = User.find(params[:user_id])
        @posts = @user.posts
    end

    def show
        @post = Post.find(params[:id])
    end

    private
        def post_params
        params.require(:post).permit(:poster, :body)
        end
end
