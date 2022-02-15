class User < ApplicationRecord
    belongs_to :user, foreign_key: "user_id"
    validates :plaintext, :key1, presence :true
end
