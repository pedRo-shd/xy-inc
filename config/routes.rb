Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :points_of_interest, only: %i[index create]
    end
  end
end
