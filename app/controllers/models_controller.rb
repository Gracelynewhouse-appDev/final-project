class ModelsController < ApplicationController
  def index
    @models = Model.all

    render("model_templates/index.html.erb")
  end

  def show
    @model = Model.find(params.fetch("id_to_display"))

    render("model_templates/show.html.erb")
  end

  def new_form
    @model = Model.new

    render("model_templates/new_form.html.erb")
  end

  def create_row
    @model = Model.new

    @model.name = params.fetch("name")

    if @model.valid?
      @model.save

      redirect_back(:fallback_location => "/models", :notice => "Model created successfully.")
    else
      render("model_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @model = Model.find(params.fetch("prefill_with_id"))

    render("model_templates/edit_form.html.erb")
  end

  def update_row
    @model = Model.find(params.fetch("id_to_modify"))

    @model.name = params.fetch("name")

    if @model.valid?
      @model.save

      redirect_to("/models/#{@model.id}", :notice => "Model updated successfully.")
    else
      render("model_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @model = Model.find(params.fetch("id_to_remove"))

    @model.destroy

    redirect_to("/models", :notice => "Model deleted successfully.")
  end
end
