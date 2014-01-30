TradeTariffAdmin::Application.routes.draw do
  namespace :notes, module: :notes do
    resources :sections, only: [:index, :show] do
      scope module: 'sections' do
        resource :section_note
        resources :chapters, only: [:index]
      end
    end

    resources :chapters, only: [:index, :show] do
      scope module: 'chapters' do
        resource :chapter_note
        resources :headings, only: [:index]
      end
    end
  end

  namespace :synonyms, module: :synonyms do
    resources :sections, only: [:index, :show] do
      scope module: 'sections' do
        resources :search_references
        resources :chapters, only: [:index]
      end
    end

    resources :chapters, only: [:index, :show] do
      scope module: 'chapters' do
        resources :search_references
        resources :headings, only: [:index]
      end
    end

    resources :headings do
      scope module: 'headings' do
        resources :search_references
        resources :commodities, only: [:index]
      end
    end

    resources :commodities do
      scope module: 'commodities' do
        resources :search_references
      end
    end
  end

  resources :tariff_updates, only: [:index]
  resources :rollbacks, only: [:index, :new, :create]
  resources :footnotes, only: [:index, :edit, :update]
  resources :measure_types, only: [:index, :edit, :update]

  post "govspeak" => "govspeak#govspeak", as: :govspeak
  get  "healthcheck" => "healthcheck#check", as: :healthcheck
  get  "/" => "pages#index", as: :index
  root to: "pages#index"
end
