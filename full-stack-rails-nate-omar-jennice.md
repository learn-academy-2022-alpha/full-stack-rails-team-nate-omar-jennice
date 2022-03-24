Review
By following the pattern of RESTful routes, we can start to implement CRUD functionality into a Rails application.

Challenges
As a developer, I have been commissioned to create an application where a user can see and create blog posts.

As a developer, I can create a full-stack Rails application.

Create a new Rails app in the appropriate folder: 

$ rails new blog -d postgresql -T
$ cd blog
Create a database: $ rails db:create

Add the dependencies for RSpec:
$ bundle add rspec-rails
$ rails generate rspec:install

Generate the model with appropriate columns and data types
$ rails generate model Blog title:string content:string

$ rails db:migrate
Generate the controller
$ rails generate controller blog
$ rails db:migrate

Begin the rails server: $ rails server
In a browser navigate to: http://localhost:3000

As a developer, my blog post can have a title and content.


As a developer, I can add new blog posts directly to my database.

Generate migration for column data type change content string to content text
$ rails db:migrate

created new.html.erb

<h2>Create a new blog post</h2>

routes.rb
    get 'blogs/new' => 'blog#new', as: 'new_blog'

blog_controller.rb

    def new
        @blog = Blog.new
    end
    def create
        @blog = Blog.create(blog_params)
        if @blog.valid?
            redirect_to blogs_path
        else
            redirect_to new_blogs_path
        end
    end

As a user, I can see all the blog titles listed on the home page of the application.

edited index.html.erb

<h1>Super Duper Blog</h1>

<ul>
<% @blog.each do |blog| %>
    <li>
     <%= blog.title %>
    </li> 
<% end %>
</ul>

As a user, I can click on the title of a blog and be routed to a page where I see the title and content of the blog post I selected.

edited index.html.erb again

<h1>Super Duper Blog</h1>

<ul>
<% @blog.each do |blog| %>
    <li>
     <%= link_to blog.title, blog_path(blog) %>
    </li> 
<% end %>
</ul>

As a user, I can navigate from the show page back to the home page.

under show.html.erb
  <p><%= link_to 'Back to Home Page', blogs_path %></p>

As a user, I see a form where I can create a new blog post.

edited new.html.erb
<h2>Create a new blog post</h2>
<%= form_with model: @blog do |form| %>
    <%= form.label :title %>
    <%= form.text_field :title %>
    <br>
    <%= form.label :content %>
    <%= form.text_field :content %>
    <br>
    <%= form.submit 'Add Blog Post' %>
  <% end %>

As a user, I can click a button that will take me from the home page to a page where I can create a blog post.

edited index.html.erb

<p><%= link_to 'New Blog', new_blog_path %></p>

As a user, I can navigate from the form back to the home page.

added to new.html.erb

<p><%= link_to 'Back to Home Page', blogs_path %></p>

As a user, I can click a button that will submit my blog post to the database.

edited new.html.erb
<h2>Create a new blog post</h2>
<%= form_with model: @blog do |form| %>
    <%= form.label :title %>
    <%= form.text_field :title %>
    <br>
    <%= form.label :content %>
    <%= form.text_field :content %>
    <br>
    <%= form.submit 'Add Blog Post' %>
  <% end %>

As a user, I when I submit my post, I am redirected to the home page.

under routes.rb

Rails.application.routes.draw do
  get 'blogs' => 'blog#index', as: 'blogs'
  post 'blogs' => 'blog#create'
  get 'blogs/new' => 'blog#new', as: 'new_blog'
  get 'blogs/:id' => 'blog#show', as: 'blog'
  root 'blog#index'
end

under blog_controller.rb

    def create
        @blog = Blog.create(blog_params)
        if @blog.valid?
            redirect_to blogs_path
        else
            redirect_to new_blogs_path
        end



Stretch Challenges
As a user, I can delete my blog post.



As a user, I can update my blog post.
As a developer, I can ensure that all blog posts have titles and content for each post.
As a developer, I can ensure that all blog post titles are unique.
As a developer, I can ensure that blog post titles are at least 10 characters.