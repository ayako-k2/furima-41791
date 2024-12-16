FactoryBot.define do
  factory :purchase_address do
    postalcode            {'123-4567'}
    prefecture_id         {2}
    city                  {'Sample City'}
    address               {'123 Street'}
    tel                   {'09012345678'}
    user_id               {2}
    item_id               {2}
    token                 {'tok_abcdefghijk00000000000000000'}
  end
end

