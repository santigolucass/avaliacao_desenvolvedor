class Purchase < ActiveRecord::Base
    belongs_to :provider
    belongs_to :costumer
  
    validates_presence_of :provider, :costumer
  
    attr_accessor :upload_file
  
    def self.process(file)
      file_value = 0
      raise 'Something wrong with file content.' if file.split("\n").count <= 1
  
      transaction do # Transaction to garantee that all the data has been saved and prevent duplicated data.
        file.split("\n").each_with_index do |line, index|
          line = line.split("\t")
          next unless index > 0 # Headers
          purchase = Purchase.new
          purchase.parse_and_save(line)
          file_value += line[2].to_f * line[3].to_i
        end
      end
      file_value
    end
  
    def parse_and_save(line)
      raise 'Something wrong with file content.' if line.count != 6 # #Raise error if file has missing content
  
      provider = Provider.where(name: line[5].force_encoding('UTF-8'), address: line[4].force_encoding('UTF-8')).first_or_create
      # #Above line find or create the provider, forcing content from file to UTF-8 to prevent errors.
      costumer = Costumer.where(name: line[0].force_encoding('UTF-8')).first_or_create
      # #Above line find or create the costumer, forcing content from file to UTF-8 to prevent errors.
  
      self.provider_id = provider.id
      self.costumer_id = costumer.id
      self.description = line[1]
      self.unity_price = line[2].to_f
      self.quantity = line[3].to_i
      save
    end
  end