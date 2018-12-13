Rails.application.routes.draw do
  devise_for :users

  root "models#index"
  
  # Routes for the Model resource:

  # CREATE
  get("/models/new", { :controller => "models", :action => "new_form" })
  post("/create_model", { :controller => "models", :action => "create_row" })

  # READ
  get("/models", { :controller => "models", :action => "index" })
  get("/models/:id_to_display", { :controller => "models", :action => "show" })

  # UPDATE
  get("/models/:prefill_with_id/edit", { :controller => "models", :action => "edit_form" })
  post("/update_model/:id_to_modify", { :controller => "models", :action => "update_row" })

  # DELETE
  get("/delete_model/:id_to_remove", { :controller => "models", :action => "destroy_row" })

  #------------------------------

  # Routes for the Training run resource:
  # CREATE
  get("/training_runs/new", { :controller => "training_runs", :action => "new_form" })
  post("/create_training_run", { :controller => "training_runs", :action => "create_row" })

  # READ
  get("/training_runs", { :controller => "training_runs", :action => "index" })
  get("/training_runs/:id_to_display", { :controller => "training_runs", :action => "show" })

  # UPDATE
  get("/training_runs/:prefill_with_id/edit", { :controller => "training_runs", :action => "edit_form" })
  post("/update_training_run/:id_to_modify", { :controller => "training_runs", :action => "update_row" })

  # DELETE
  get("/delete_training_run/:id_to_remove", { :controller => "training_runs", :action => "destroy_row" })

  #------------------------------

  # Routes for the Dataset resource:

  # CREATE
  get("/datasets/new", { :controller => "datasets", :action => "new_form" })
  post("/create_dataset", { :controller => "datasets", :action => "create_row" })

  # READ
  get("/datasets", { :controller => "datasets", :action => "index" })
  get("/datasets/:id_to_display", { :controller => "datasets", :action => "show" })

  # UPDATE
  get("/datasets/:prefill_with_id/edit", { :controller => "datasets", :action => "edit_form" })
  post("/update_dataset/:id_to_modify", { :controller => "datasets", :action => "update_row" })

  # DELETE
  get("/delete_dataset/:id_to_remove", { :controller => "datasets", :action => "destroy_row" })

  #------------------------------

  # Routes for the Model competancy resource:

  # CREATE
  get("/model_competancies/new", { :controller => "model_competancies", :action => "new_form" })
  post("/create_model_competancy", { :controller => "model_competancies", :action => "create_row" })

  # READ
  get("/model_competancies", { :controller => "model_competancies", :action => "index" })
  get("/model_competancies/:id_to_display", { :controller => "model_competancies", :action => "show" })

  # UPDATE
  get("/model_competancies/:prefill_with_id/edit", { :controller => "model_competancies", :action => "edit_form" })
  post("/update_model_competancy/:id_to_modify", { :controller => "model_competancies", :action => "update_row" })

  # DELETE
  get("/delete_model_competancy/:id_to_remove", { :controller => "model_competancies", :action => "destroy_row" })

  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
