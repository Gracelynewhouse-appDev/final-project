class DatasetsController < ApplicationController
  def index
    @datasets = Dataset.all

    render("dataset_templates/index.html.erb")
  end

  def show
    @dataset = Dataset.find(params.fetch("id_to_display"))

    render("dataset_templates/show.html.erb")
  end

  def new_form
    @dataset = Dataset.new

    render("dataset_templates/new_form.html.erb")
  end

  def create_row
    @dataset = Dataset.new

    @dataset.data_type = params.fetch("data_type")
    @dataset.name = params.fetch("name")
    @dataset.number_rows = params.fetch("number_rows")

    if @dataset.valid?
      @dataset.save

      redirect_back(:fallback_location => "/datasets", :notice => "Dataset created successfully.")
    else
      render("dataset_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @dataset = Dataset.find(params.fetch("prefill_with_id"))

    render("dataset_templates/edit_form.html.erb")
  end

  def update_row
    @dataset = Dataset.find(params.fetch("id_to_modify"))

    @dataset.data_type = params.fetch("data_type")
    @dataset.name = params.fetch("name")
    @dataset.number_rows = params.fetch("number_rows")

    if @dataset.valid?
      @dataset.save

      redirect_to("/datasets/#{@dataset.id}", :notice => "Dataset updated successfully.")
    else
      render("dataset_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @dataset = Dataset.find(params.fetch("id_to_remove"))

    @dataset.destroy

    redirect_to("/datasets", :notice => "Dataset deleted successfully.")
  end
end
