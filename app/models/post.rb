class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction, No Fiction)}
    validates :title_is_clickbait
    def title_is_clickbait
        if !(["Won't Believe","Secret","Top [number]","Guess"].any?{|word|"#{title}".include?(word)})
            errors.add(:title, "is not clickbait")
        end
    end
end
