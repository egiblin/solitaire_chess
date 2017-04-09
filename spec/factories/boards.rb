FactoryGirl.define do
  factory :square11 do
    location [1,1]
    occupied true
  end
end

FactoryGirl.define do
  factory :square12 do
    location [1,2]
    occupied true
  end
end

FactoryGirl.define do
  factory :square13 do
    location [1,3]
    occupied false
  end
end

FactoryGirl.define do
  factory :square14 do
    location [1,4]
    occupied true
  end
end

FactoryGirl.define do
  factory :square21 do
    location [2,1]
    occupied false
  end
end

FactoryGirl.define do
  factory :square22 do
    location [2,2]
    occupied true
  end
end

FactoryGirl.define do
  factory :square23 do
    location [2,3]
    occupied false
  end
end

FactoryGirl.define do
  factory :square24 do
    location [2,4]
    occupied false
  end
end

FactoryGirl.define do
  factory :square31 do
    location [3,1]
    occupied false
  end
end

FactoryGirl.define do
  factory :square32 do
    location [3,2]
    occupied false
  end
end

FactoryGirl.define do
  factory :square33 do
    location [3,3]
    occupied false
  end
end

FactoryGirl.define do
  factory :square34 do
    location [3,4]
    occupied false
  end
end

FactoryGirl.define do
  factory :square41 do
    location [4,1]
    occupied false
  end
end

FactoryGirl.define do
  factory :square42 do
    location [4,2]
    occupied false
  end
end

FactoryGirl.define do
  factory :square43 do
    location [4,3]
    occupied false
  end
end

FactoryGirl.define do
  factory :square44 do
    location [4,4]
    occupied true
  end
end

FactoryGirl.define do
  factory :board do
    [:square11, :square12, :square13, :square14, :square21, :square22, :square23, :square24, :square31,
    :square32, :square33, :square34, :square41, :square42, :square43, :square44]
  end
end
