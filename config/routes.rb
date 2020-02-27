Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  # homeのページを作成し、ここにルートパスを割り当てる。(投稿一覧を表示するページ)
  get "posts/home" => "posts#home"
  root 'posts#home'

end
