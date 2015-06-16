class Slider < ActiveRecord::Base 
  has_attached_file :picture, :styles => {:slideshow => "1024x940>"}, :path => ":rails_root/app/assets/images/:filename", :url => ":filename"
  
  validates :picture, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :picture
  #or use helper style validations
  validates_attachment_content_type :picture, 
                                      :content_type => /^image\/(png|gif|jpeg)/,
                                      :message => 'only (png/gif/jpeg/jpg) images'
  validates_attachment_size :picture,  :in => 0..1024.kilobytes
end
