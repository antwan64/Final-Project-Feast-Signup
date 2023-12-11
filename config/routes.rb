Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Routes for the Event resource:

  root to: "events#index"

  # CREATE
  post("/insert_event", { :controller => "events", :action => "create" })
          
  # READ
  get("/events", { :controller => "events", :action => "index" })
  
  get("/events/:path_id", { :controller => "events", :action => "show" })
  
  # UPDATE
  
  post("/modify_event/:path_id", { :controller => "events", :action => "update" })
  
  # DELETE
  get("/delete_event/:path_id", { :controller => "events", :action => "destroy" })

  #------------------------------

  # Routes for the Menu resource:

  # CREATE
  post("/insert_menu", { :controller => "menus", :action => "create" })
          
  # READ
  get("/menus", { :controller => "menus", :action => "index" })
  
  get("/menus/:path_id", { :controller => "menus", :action => "show" })
  
  # UPDATE
  
  post("/modify_menu/:path_id", { :controller => "menus", :action => "update" })

  post("/sign_up_for_menu_item", { :controller => "menus", :action => "sign_up_for_menu_item" })
  
  # DELETE
  get("/delete_menu/:path_id", { :controller => "menus", :action => "destroy" })

    # READ
  get("/users/signed_up_items", { :controller => "users", :action => "signed_up_items" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
