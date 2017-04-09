FactoryGirl.define do
  factory :pawn do
    location [1,1]
  end
end

FactoryGirl.define do
  factory :rook do
    location [1,2]
  end
end

FactoryGirl.define do
  factory :queen do
    location [2,2]
  end
end

FactoryGirl.define do
  factory :bishop do
    location [3,3]
  end
end

FactoryGirl.define do
  factory :king do
    location [4,4]
  end
end

FactoryGirl.define do
  factory :knight do
    location [1,4]
  end
end
