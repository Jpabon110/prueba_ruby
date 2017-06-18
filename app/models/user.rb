class User < ApplicationRecord

	validates :rut, presence: true, uniqueness: true 
	validates :nombre, presence: true 
	validates :apellido, presence: true 
	validates :email, presence: true, email_format: { message: "doesn't look like an email address" } 
	validates :birth, presence: true 
	validates :password, presence: true 


	has_attached_file :image , style: { medium: "200x200", thumb:"600x600"}

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


end
