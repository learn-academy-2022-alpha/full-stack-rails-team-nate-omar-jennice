require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'is not valid without a title' do
    blog_post= Blog.create content: 'my content'
    expect(blog_post.errors[:title]).to_not be_empty
  end
  it 'is not valid without content' do
    blog_post2= Blog.create title: 'my title'
    expect(blog_post2.errors[:content]).to_not be_empty
  end
  it 'is not valid without title longer than atleast 10 characters' do
    blog_post3= Blog.create title: 'my tit', content: 'my content'
    expect(blog_post3.errors[:title]).to_not be_empty
  end
end
