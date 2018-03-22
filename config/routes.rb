Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      get 'get_by_proximity', to: 'points_of_interest#get_by_proximity'
      resources :points_of_interest, only: %i[index create]
    end
  end
end
