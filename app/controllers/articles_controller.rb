class ArticlesController < ApplicationController
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
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

		@article.save
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to article_path(@article)
	end
end
