FactoryBot.define do
  factory :rollback do
    user

    jid { 10.times.map { Random.rand(1..9) }.join }
    enqueued_at { Date.today.to_date }
    keep { [true, false].sample }
    date { Date.today.ago(1.month).to_date }
  end
end
