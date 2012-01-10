class Ticket < ActiveRecord::Base
  validates :title, :presence => true
  validates :description, :presence => true,
            :length => { :minimum => 10 }
  belongs_to :project
  belongs_to :state
  belongs_to :user
  
  has_many :assets
  accepts_nested_attributes_for :assets
  has_many :comments
  has_and_belongs_to_many :tags
  
  
  def tag!(tags)
    tags = tags.split(" ").map do |tag|
    Tag.find_or_create_by_name(tag)
    end
    self.tags << tags
  end
    
end
