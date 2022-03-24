class BlogController < ApplicationController
    def index
        @blog = Blog.all
    end
    def show
        @blog = Blog.find(params[:id])
    end
    def new
        @blog = Blog.new
    end
    def create
        @blog = Blog.create(blog_params)
        if @blog.valid?
            redirect_to blogs_path
        else
            redirect_to new_blogs_path
        end
    end
    def edit
        @blog = Blog.find(params[:id])
        render :edit
    end
    def destroy
        @blog = Blog.find(params[:id])
        @blog.destroy
        redirect_to blogs_path, status: :see_other
    end
    def update
        @blog = Blog.find(params[:id])

        # full_params = params
        # # full params = {}
        # blog_params = params[:blog]
        # # blog_params = {}
        # # [:key] is how you access a value in a hash
        # blog_title = blog_params[:title]

        # puts 'test'
        # puts params
        # puts params[:title]
        # puts 'test'

        # @blog.title = params[:blog][:title]
        # @blog.content = params[:blog][:content]
        # @blog.save

        # @blog.update({title: 'test title', content: 'test content'})

        # this should fail because of strong params
        # @blog.update(params[:blog])

        update_res = @blog.update(blog_params)
        # update runs on the individual instances, while create runs on the Class
        # using strong_params to get the hash from the form
    end
    private
    def blog_params
        params.require(:blog).permit(:title, :content)
    end
end
