class Club < ActiveRecord::Base
  attr_accessible :name, :netname

  validates :name, presence: true, 
                   uniqueness: true, 
                   length: { maximum: 64 }
            
  VALID_NETNAME_REGEX = /^[[:alnum:]][[:alnum:]-]*$/
  validates :netname, presence: true, 
                      uniqueness: { case_sensitive: false },
                      format: { with: VALID_NETNAME_REGEX,
                                message: "Only letters, numbers, and dashes allowed, and must start with a letter or number."},
                      length: { maximum: 64 }
end
