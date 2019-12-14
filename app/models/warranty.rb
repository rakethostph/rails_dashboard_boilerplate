class Warranty < ApplicationRecord
	resourcify
	belongs_to :product

	validates  :product_serial_number, presence: true 
	validates  :client_id, presence: true 
	validates  :product_id, presence: true
	# def start_time
 #        self.my_related_model.start ##Where 'start' is a attribute of type 'Date' accessible through MyModel's relationship
 #    end

end
