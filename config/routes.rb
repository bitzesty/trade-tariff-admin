TradeTariffAdmin::Application.routes.draw do
  scope :path => "#{APP_SLUG}" do

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
        end
      end
    end

    resources :tariff_updates, only: [:index]

    post "preview" => "govspeak#preview", as: :preview
    get  "healthcheck" => "healthcheck#check", as: :healthcheck
    get  "/" => "pages#index", as: :index
  end

  root :to => redirect("/#{APP_SLUG}", :status => 302)
end
