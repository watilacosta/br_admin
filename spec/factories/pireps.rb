FactoryBot.define do
  factory :pirep do
    pilot { nil }
    orig { "MyString" }
    dest { "MyString" }
    eqpt { "MyString" }
    hours { "MyString" }
    pirep { "MyText" }
  end
end
