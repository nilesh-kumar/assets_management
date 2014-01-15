class AssetRequest < ActiveRecord::Base
  attr_accessible :date, :description, :title, :vendor_id

  #ASSOCIATION

  belongs_to :vendor
  has_many :quotations, :dependent => :destroy

  #VALIDATION
  validates :vendor_id, presence: true
  validates :title, presence: true
  validates :description, presence: true
  

  #METHODS

  def self.search(search = nil,action)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      if action == "index"
       self
      end
    end
  end

end
