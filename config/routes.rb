Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'github_accounts#index'

  get 'github_accounts' => 'github_accounts#index'
  get 'github_accounts/:id' => 'github_accounts#show', as: 'github_account'

end
