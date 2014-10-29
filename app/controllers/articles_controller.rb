class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		# Posting article in rendering each item fashion
		# @article = Article.new(
		# 	title: params[:article][:title],
		# 	body: params[:article][:body]
		# )
		
		# Posting article in bypassing fashion
		# @article = Article.new(params[:article])

		# Posting article with parameter designed in ArticlesHelper
		@article = Article.new(article_params)

		flash.notice = "Article '#{@article.title}' saved!"
		
		@article.save
		redirect_to article_path(@article)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update_attributes(article_params)

		flash.notice = "Article '#{@article.title}' updated!"

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		
		flash.notice = "Article '#{@article.title}' deleted!"
		
		@article.destroy
		redirect_to article_path(@article)
	end
end
