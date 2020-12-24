FactoryBot.define do
  factory :book do
    name { "Book" }
    genre { "Meaty" }
    image { "book1.jpg" }
    user 
  end
end
