class ResearchesController < ApplicationController
def new
		@research = Research.new
	end
	
	def index
		@researches =Research.all(:order => "created_at DESC")
	end
	
	def create
		@research = Research.new(params[:research].permit( :title , :text))
		
		if @research.save
			redirect_to @research
		else
			render 'new'
		end
	end
	
	def show
		@research =Research.find(params[:id])
	end
	
	def destroy
		@research = Research.find(params[:id])
		@research.destroy
		
		redirect_to researches_path
	end
	
	def edit
		@research = Research.find(params[:id])
	end
	
	def update
		@research = Research.find(params[:id])
		
		if @research.update(params[:research].permit(:title,:text))
			redirect_to @research
		else
			render 'edit'
		end
	end
	
	private
		def research_params
			params.require(:research).permit( :title , :text)
		end
end
