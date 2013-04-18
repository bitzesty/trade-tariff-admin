FactoryGirl.define do
  factory :section do
    position { id }
    numeral  { id  }
    title    { "Section Title" }
  end
end
