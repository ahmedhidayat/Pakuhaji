class Article < ActiveRecord::Base
    
 #specify that the avatar is a paperclip file attachment
  #specify additional styles that you want to use in views or eslewhere
  
  has_attached_file :picture, :styles => {:thumb => "100x200>", :detail => "500x500>" }
  
  validates :picture, :attachment_presence => true
  validates_with AttachmentPresenceValidator, :attributes => :picture
  
  #or use helper style validations
  validates_attachment_content_type :picture, 
                                      :content_type => /^image\/(png|gif|jpeg)/,
                                      :message => 'only (png/gif/jpeg) images'
  validates_attachment_size :picture,  :in => 0..3024.kilobytes  
end
