#Factory.define :ticket do |ticket|
#  ticket.title "A ticket"
#  ticket.description "A ticket, nothing more"
#  ticket.user { |u| u.association(:user) }
#  ticket.project { |p| p.association(:project) }
#end

Factory.define do
  factory :ticket do
    title "A ticket"
    description "A ticket, nothing more"
    user { |u| u.association(:user) }
    project { |p| p.association(:project) }
  end
end