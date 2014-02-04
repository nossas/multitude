Multitude::Application.routes.draw do
  root 'tasks#index'

  resources :tasks, only: [:index, :new, :create, :show, :edit, :update] do
    resources :task_subscriptions, only: [:create] do
      resources :deliveries, only: [:create] do
        member do
          patch 'deliver'
          patch 'accept'
          patch 'reject'
        end
      end
    end
  end

end
