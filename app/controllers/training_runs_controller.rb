class TrainingRunsController < ApplicationController
  def index
    @training_runs = TrainingRun.all

    render("training_run_templates/index.html.erb")
  end

  def show
    @training_run = TrainingRun.find(params.fetch("id_to_display"))

    render("training_run_templates/show.html.erb")
  end

  def new_form
    @training_run = TrainingRun.new

    render("training_run_templates/new_form.html.erb")
  end

  def create_row
    @training_run = TrainingRun.new

    @training_run.model_id = params.fetch("model_id")
    @training_run.dataset_id = params.fetch("dataset_id")
    @training_run.iteration = params.fetch("iteration")
    @training_run.accuracy_score = params.fetch("accuracy_score")

    if @training_run.valid?
      @training_run.save

      redirect_back(:fallback_location => "/training_runs", :notice => "Training run created successfully.")
    else
      render("training_run_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @training_run = TrainingRun.find(params.fetch("prefill_with_id"))

    render("training_run_templates/edit_form.html.erb")
  end

  def update_row
    @training_run = TrainingRun.find(params.fetch("id_to_modify"))

    @training_run.model_id = params.fetch("model_id")
    @training_run.dataset_id = params.fetch("dataset_id")
    @training_run.iteration = params.fetch("iteration")
    @training_run.accuracy_score = params.fetch("accuracy_score")

    if @training_run.valid?
      @training_run.save

      redirect_to("/training_runs/#{@training_run.id}", :notice => "Training run updated successfully.")
    else
      render("training_run_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @training_run = TrainingRun.find(params.fetch("id_to_remove"))

    @training_run.destroy

    redirect_to("/training_runs", :notice => "Training run deleted successfully.")
  end
end
