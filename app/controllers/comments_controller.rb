class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :destroy]

	def create
    	@comment = @article.comments.build(comment_params)

      respond_to do |format|
        if @comment.save
           format.html { redirect_to article_path(@article) }
        else
           format.html do
              # remember to declare any instance variables that ArticlesController#show requires
              # e.g. @article = ...
              @article = Article.find(params[:article_id])
              @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
              render 'articles/show'
           end
        end
      end
  	end

  	def destroy
	    @comment = @article.comments.find(params[:id])
	    @comment.destroy
	    redirect_to article_path(@article)
	end
 
  	private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:article_id])
    end

    def comment_params
      	params.require(:comment).permit(:commenter, :body)
    end
end
