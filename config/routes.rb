class MainSite
  def self.matches?(request)
    #request.subdomain.blank?
    request.subdomain == 'documintapp' || request.subdomain == 'www'
  end
end

Saas::Application.routes.draw do

  devise_for :saas_admins
  mount RailsAdmin::Engine => '/saas_admin', :as => 'rails_admin'

  # Routes for the public site
  constraints MainSite do
    # Homepage
    get '/' => "content#index"

    # Other content routes, like privacy policy, about us, etc.
    %w(about privacy).each do |page|
      get page => "content##{page}"
    end

    #Contact Form
    match '/contacts',     to: 'contacts#new',             via: 'get'
    resources "contacts", only: [:new, :create]

    # Account Signup Routes
    get '/signup' => 'accounts#plans', :as => 'plans'
    get '/signup/d/:discount' => 'accounts#plans'
    get '/signup/thanks' => 'accounts#thanks', :as => 'thanks'
    post '/signup/create/:discount' => 'accounts#create', :as => 'create', :defaults => { :discount => nil }
    get '/signup/:plan/:discount' => 'accounts#new'
    get '/signup/:plan' => 'accounts#new', :as => 'new_account'

  end

  root :to => "accounts#dashboard"

  devise_for :users

  #
  # Account / User Management Routes
  #
  resources :users
  resource :account do
    member do
      get :dashboard, :thanks, :plans, :canceled
      match 'billing' => "accounts#billing", via: [ :get, :post ]
      match 'plan' => "accounts#plan", via: [ :get, :post ]
      match 'cancel' => "accounts#cancel", via: [ :get, :post ]
    end
  end

  get 'tags/:tag', to: 'documents#index', as: :tag
  resources :documents do
    resources :steps
  end
  resources :messages

  %w(about privacy features).each do |page|
      get page => "content##{page}"
    end
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]

end
