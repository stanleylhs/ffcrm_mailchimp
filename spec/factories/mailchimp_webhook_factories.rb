FactoryGirl.define do

  factory :mc_webhook, class: Hash do
    data {{ email: "test@example.com",
            merges: {
              EMAIL: "test@example.com",
              FNAME: "Bob",
              LNAME: "Lee",
              INTERESTS: "group1, group2",
              GROUPINGS: {"0"=>
                {"id"=>"5641",
                 "name"=>"Groups",
                 "groups"=>"group1, group2"
                }
              }
            },
            new_email: "new_test@example.com",
            old_email: "test@example.com",
            list_id: "3e26bc072d"
         }}
    type "subscribe"
    controller "ffcrm_endpoint/endpoints"
    action     "consume"
    klass_name  "mailchimp_endpoint"
    initialize_with { attributes }
  end

end