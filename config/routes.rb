Multitude::Application.routes.draw do
  root 'tasks#index'
  get '/about', to: "pages#about", as: :about

  resources :tasks, only: [:index, :new, :create, :show, :edit, :update] do
    resources :rewards, only: [:create]

    resources :deliveries, only: [:create] do
      member do
        patch 'deliver'
        patch 'accept'
        patch 'reject'
      end
    end

    resources :task_subscriptions, only: [:create] do
      collection do
        get :create_from_session, to: "task_subscriptions#create"
      end
    end
  end
end
