class ApplicationController < ActionController::Base
  
  protected
  
  def retrieve_type_doc(user, doc)
    i = 0
    user.attachments.each do |attachment|
      i +=1 if attachment.type_doc == doc 
    end
    return i
  end

end
