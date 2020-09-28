class StepsController < ApplicationController
  before_action :find_document
  before_action :find_step, only: [:destroy]

  def index
    @steps = Step.all
    render 'edit'
  end

  def create
  	@step = @document.steps.create(step_params)
  	render 'edit'
  end

  def destroy
    @step.destroy
  	render 'edit'
  end


  private

  def find_document
	  @document = Document.find(params[:document_id])
  end

  def find_step
  	@step = @document.steps.find(params[:id])
  end

  def step_params
	  params.require(:step).permit(:summary, :content, :image)
  end
end