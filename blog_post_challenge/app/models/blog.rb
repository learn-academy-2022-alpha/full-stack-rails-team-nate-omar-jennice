class Blog < ApplicationRecord
    validates :title, :content, presence: true
    validates :title, length: { is: 10 }
end
