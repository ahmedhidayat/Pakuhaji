class Fasility < ActiveRecord::Base
  has_attached_file :picture1, :styles => {:thumb => "100x200>", :thumbfasility => "150x150"}
  has_attached_file :picture2, :styles => {:thumb => "100x200>", :thumbfasility => "150x150"}
  has_attached_file :picture3, :styles => {:thumb => "100x200>", :thumbfasility => "150x150"}
  validates :picture1, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :picture1
  validates :picture2, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :picture2
  validates :picture3, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :picture3
  
  #or use helper style validations
  validates_attachment_content_type :picture1, 
                                      :content_type => /^image\/(png|gif|jpeg)/,
                                      :message => 'only (png/gif/jpeg) images'
  validates_attachment_size :picture1,  :in => 0..3024.kilobytes  
  validates_attachment_content_type :picture2, 
                                      :content_type => /^image\/(png|gif|jpeg)/,
                                      :message => 'only (png/gif/jpeg) images'
  validates_attachment_size :picture2,  :in => 0..3024.kilobytes
  validates_attachment_content_type :picture3, 
                                      :content_type => /^image\/(png|gif|jpeg)/,
                                      :message => 'only (png/gif/jpeg) images'
  validates_attachment_size :picture3,  :in => 0..3024.kilobytes  
end
