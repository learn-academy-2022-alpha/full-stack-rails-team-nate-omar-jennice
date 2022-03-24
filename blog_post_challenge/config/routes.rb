Rails.application.routes.draw do
  get 'blogs' => 'blog#index', as: 'blogs'
  post 'blogs' => 'blog#create'
  get 'blogs/new' => 'blog#new', as: 'new_blog'
  get 'blogs/:id' => 'blog#show', as: 'blog'
  get 'blogs/edit/:id', to: 'blog#edit', as: 'edit'
  patch 'blogs/:id', to: 'blog#update', as: 'update'
  delete 'blogs/:id(.:format)' => 'blog#destroy'
  root 'blog#index'
end
