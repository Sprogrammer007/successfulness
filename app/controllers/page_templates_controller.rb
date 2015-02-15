class PageTemplatesController < ApplicationController
  
  def new

  end

  def create
    template = PageTemplate.create(safe_params)
    if template.save
      redirect_to root_path, notice: "new template created"
    else
      flash.now.alert = "failed"
      redirect_to root_path
    end
  end


  private

    def safe_params
      params.require(:page_template).permit(:name, :descriptions, :template_category_id, :thumbnail)
    end
end
