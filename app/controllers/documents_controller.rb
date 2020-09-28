class DocumentsController < ApplicationController
	inherit_resources
	before_action :find_document, only: [:show, :edit, :update, :destroy]

	def index
		if params[:tag]
    			@documents = Document.tagged_with(params[:tag])
  		else
			@documents = Document.all
		end

		@tags = ActsAsTaggableOn::Tag.all
	end

	def show
	end

	def new
		@document = Document.new
	end

	def create
		@document = Document.new(document_params)
		if @document.save
			redirect_to @document, notice: "Document created!"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @document.update(document_params)
			redirect_to documents_path, notice: "Document updated!"
		else
			render :edit
		end
	end

	def destroy
    @document.destroy
  	redirect_to documents_path, notice: "Document deleted."
  end

	private

	def begin_of_association_chain
      current_account
	end

	def find_document
		@document = Document.find(params[:id])
	end

	def document_params
		params.require(:document).permit(:account_id, :title, :description, :persons, :requirements, :exceptions, :tag_list)
	end
end
