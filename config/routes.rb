TradeTariffAdmin::Application.routes.draw do
  scope :path => "#{APP_SLUG}" do
    resources :section_notes
    resources :chapter_notes

    post "preview" => "previewer#render", as: :preview
    get  "healthcheck" => "healthcheck#check", as: :healthcheck
    get  "/" => "pages#index", as: :index
  end

  root :to => redirect("/#{APP_SLUG}", :status => 302)
end
