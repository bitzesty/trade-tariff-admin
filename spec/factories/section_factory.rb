FactoryGirl.define do
  factory :section do
    position { id }
    numeral  { id  }
    title    { "Section Titlte #{id}" }
  end
end
