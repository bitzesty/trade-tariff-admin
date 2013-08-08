TradeTariffAdmin::Application.routes.draw do
  scope :path => "#{APP_SLUG}" do

    resources :sections, only: [:index, :show] do
      resource :section_note, module: 'sections'
    end

    resources :chapters, only: [:index, :show] do
      resource :chapter_note, module: 'chapters'
    end

    post "preview" => "previewer#render", as: :preview
    get  "healthcheck" => "healthcheck#check", as: :healthcheck
    get  "/" => "pages#index", as: :index
  end

  root :to => redirect("/#{APP_SLUG}", :status => 302)
end
