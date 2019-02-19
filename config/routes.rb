Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#home_page'

  namespace :web_site, path: "/" do

    get "users/sign_up" => "users#sign_up", as: :user_sign_up
    post "user_signed_up" => "users#user_signed_up", as: :user_signed_up

    get "users/login" => "users#login", as: :user_login
    put "user_logged_in" => "users#user_logged_in", as: :user_logged_in

    #to_do_lists
    get "user/:id/to_do_lists" => "to_do_lists#index",as: :to_do_list_index
    get "user/:id/to_do_lists/:to_do_list_id" => "to_do_lists#show",as: :show_to_do_list

    get "user/:id/new_to_do_list" => "to_do_lists#new",as: :new_to_do_list
    post "user/:id/create_to_do_list" => "to_do_lists#create",as: :create_to_do_list

    get "user/:id/to_do_lists/:to_do_list_id/edit" => "to_do_lists#edit",as: :edit_to_do_list
    put "user/:id/to_do_lists/:to_do_list_id/update" => "to_do_lists#update",as: :update_to_do_list

    delete "user/:id/to_do_lists/:to_do_list_id/delete" => "to_do_lists#delete",as: :delete_to_do_list

    #to_do_items
    get "user/:id/to_do_lists/:to_do_list_id/to_do_items" => "to_do_items#index",as: :to_do_items_index
    get "user/:id/to_do_lists/:to_do_list_id/to_do_items/:to_do_item" => "to_do_items#show",as: :show_to_do_item

    get "user/:id/to_do_lists/:to_do_list_id/new_to_do_items" => "to_do_items#new",as: :new_to_do_item
    post "user/:id/to_do_lists/:to_do_list_id/create_to_do_items" => "to_do_items#create",as: :create_to_do_item

    get "user/:id/to_do_lists/:to_do_list_id/to_do_items/:to_do_item_id/edit" => "to_do_items#edit",as: :edit_to_do_item
    put "user/:id/to_do_lists/:to_do_list_id/to_do_items/:to_do_item_id/update" => "to_do_items#update",as: :update_to_do_item

    delete "user/:id/to_do_lists/:to_do_list_id/to_do_items/:to_do_item_id/delete" => "to_do_items#delete",as: :delete_to_do_item

  end

end