class ModelCompetanciesController < ApplicationController
  def index
    @model_competancies = ModelCompetancy.all

    render("model_competancy_templates/index.html.erb")
  end

  def show
    @model_competancy = ModelCompetancy.find(params.fetch("id_to_display"))

    render("model_competancy_templates/show.html.erb")
  end

  def new_form
    @model_competancy = ModelCompetancy.new

    render("model_competancy_templates/new_form.html.erb")
  end

  def create_row
    @model_competancy = ModelCompetancy.new

    @model_competancy.model_id = params.fetch("model_id")
    @model_competancy.user_id = params.fetch("user_id")

    if @model_competancy.valid?
      @model_competancy.save

      redirect_back(:fallback_location => "/model_competancies", :notice => "Model competancy created successfully.")
    else
      render("model_competancy_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @model_competancy = ModelCompetancy.find(params.fetch("prefill_with_id"))

    render("model_competancy_templates/edit_form.html.erb")
  end

  def update_row
    @model_competancy = ModelCompetancy.find(params.fetch("id_to_modify"))

    @model_competancy.model_id = params.fetch("model_id")
    @model_competancy.user_id = params.fetch("user_id")

    if @model_competancy.valid?
      @model_competancy.save

      redirect_to("/model_competancies/#{@model_competancy.id}", :notice => "Model competancy updated successfully.")
    else
      render("model_competancy_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @model_competancy = ModelCompetancy.find(params.fetch("id_to_remove"))

    @model_competancy.destroy

    redirect_to("/model_competancies", :notice => "Model competancy deleted successfully.")
  end
end
