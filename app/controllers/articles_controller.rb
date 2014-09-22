class ArticlesController < ApplicationController
    include ArticlesHelper
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])

        @attachment = Attachment.new
        @attachment.article_id = @article.id
        
        @comment = Comment.new
        @comment.article_id = @article.id
    end
    def new
        @article = Article.new
    end
    def create
        #@article = Article.new(
            #title: params[:article][:title],
            #body: params[:article][:body])
            # ou 
        @article = Article.new(article_params) #definido em app/helpers/articles_helper.rb
        @article.save
        flash.notice = "Article '#{@article.title}' created!"
        redirect_to article_path(@article)
    end
    def destroy
       @article = Article.find(params[:id]) 
       @article.destroy

       flash.notice = "Article '#{@article.title}' deleted!"

       redirect_to articles_path
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' updated!"

        redirect_to article_path(@article)
    end
end
