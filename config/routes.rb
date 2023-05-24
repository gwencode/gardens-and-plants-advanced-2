Rails.application.routes.draw do
  root "gardens#index"
  resources :gardens, except: :index do
    resources :plants, only: :create
  end
  resources :plants, only: :destroy
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

# Etapes pour ajouter le model Tag et le model Plant Tag
# 1. Faire le schéma de DB
# 2. Générer le model Tag
# 3. Générer le model PlantTag
# 4. Ajouter des associations et des validations
# 5. Tester dans rails c
