class Purchase < ActiveRecord::Base
    belongs_to :provider
    belongs_to :costumer
  
    validates_presence_of :provider, :costumer
  
    attr_accessor :upload_file

end