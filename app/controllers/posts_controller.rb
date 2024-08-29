class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  
  def top
    
  end

 
    def index

        if params[:tag]
          Tag.create(name: params[:tag])
        end
        
        if params[:tag_ids]
          @posts = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_posts = Tag.find_by(name: key).posts
              @posts = @posts.empty? ? tag_psots : @posts & tag_psots
            end
          end
        end

    end

    def index
      
      @posts = Post.all

      @posts = Post.includes(:liked_users).sort {|a,b| b.liked_users.size <=> a.liked_users.size}

    end

    def new
        @post = Post.new
    end
    
      def show
        @post = Post.find(params[:id])
      end

      def date
        @dates = Post.where(category:"date") #ここがポイント！categoryのバリューがdogの投稿を取得！
      end
    
      def travel
        @travels = Post.where(category:"travel") #ここがポイント！categoryのバリューがcatの投稿を取得！
      end
    
      def cafe
        @cafes = Post.where(category:"cafe") #ここがポイント！categoryのバリューがhadakadebanezumiの投稿を取得！
      end

      def edit
        @post = Post.find(params[:id])
      end

      def update
        post = Post.find(params[:id])
        if post.update(post_params)
          redirect_to :action => "show", :id => post.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to action: :index
      end

      def create
        post = Post.new(post_params)
       
        post.user_id = current_user.id

        if post.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      private
      def post_params
        params.require(:post).permit(:cotent, :image, :category, :evaluations, :comments, :body, tag_ids: [])
      end
end
