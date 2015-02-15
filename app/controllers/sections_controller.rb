class SectionsController < ApplicationController
  before_filter :authenticate_user!, only: [:index]
  before_filter :authenticate_teacher!, only: [:new, :create, :edit, :update, :destroy]
  layout "app_ember"
  
  def index
    @sections = current_user.sections
  end
  
  def new
    @section = Section.new()
  end

  def create
    
    @section = current_user.sections.create(safe_params)
    if @secion.save
      flash.now.notice = "new template created"
      redirect_to sections_path()
  else
      flash.now.alert = "failed"
      redirect_to sections_path()
    end
  end

  def edit_template
    section = Section.find(params[:id])
    @template = section.page_template.uri
  end

  private

    def safe_params
      params.require(:section).permit(:title, :note, :page_template_id)
    end
end