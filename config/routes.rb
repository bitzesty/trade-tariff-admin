TradeTariffAdmin::Application.routes.draw do
  scope :path => "#{APP_SLUG}" do
    get "healthcheck" => "healthcheck#check"
    get "/" => "pages#index"
  end

  root :to => redirect("/#{APP_SLUG}", :status => 302)
end
