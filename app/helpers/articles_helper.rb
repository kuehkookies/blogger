module ArticlesHelper

	# Permitting some of the params only. In case of unnecessary params added
	def article_params
	  params.require(:article).permit("title", "body")
	end
end
