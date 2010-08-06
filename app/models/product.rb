class Product < ActiveRecord::Base
  after_create :add_to_dj
  has_attached_file :photo, :styles => { :small => "150x150>" },
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  before_photo_post_process :stop_default_processing
  
  
  def stop_default_processing
    puts "We are inside stop_default_processing\n"*10
     false if self.processing?
  end

  
  def add_to_dj
    Delayed::Job.enqueue ProductJob.new(self.id)
  end
  
  
  def perform
    self.processing = false
    self.photo.reprocess!
    self.save
  end

end
