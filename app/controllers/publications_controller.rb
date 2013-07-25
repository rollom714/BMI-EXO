class PublicationsController < ApplicationController
	
	def new
		@publication = Publication.new
	end
	
	def index
		@publications =Publication.all(:order => "created_at DESC")
	end
	
	def create
		@publication = Publication.new(params[:publication].permit( :title , :text))
		
		if @publication.save
			redirect_to @publication
		else
			render 'new'
		end
	end
	
	def show
		@publication =Publication.find(params[:id])
	end
	
	def destroy
		@publication = Publication.find(params[:id])
		@publication.destroy
		
		redirect_to publications_path
	end
	
	def edit
		@publication = Publication.find(params[:id])
	end
	
	def update
		@publication = Publication.find(params[:id])
		
		if @publication.update(params[:publication].permit(:title,:text))
			redirect_to @publication
		else
			render 'edit'
		end
	end
	
	private
		def publication_params
			params.require(:publication).permit( :title , :text)
		end
end
