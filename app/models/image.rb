class Image < ApplicationRecord
    validates :filename, presence: true
end
