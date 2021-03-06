require "paperclip/globalize3/version"
require "paperclip/globalize3/attachment"

require "globalize"
require "paperclip"

Paperclip.interpolates(:locale) { |attachment, _|
  if attachment.instance.send("#{attachment.name}_file_name").respond_to?(:translation_metadata)
    attachment.instance.send("#{attachment.name}_file_name").translation_metadata[:locale].to_s
  else
    Globalize.locale.to_s
  end
}

unless Paperclip::Attachment.instance_methods.include?(:assign_attributes)
  Paperclip::Attachment.send(:include, Paperclip::Globalize3::Attachment::Compatibility::Paperclip41)
end

Paperclip::Attachment.send(:include, Paperclip::Globalize3::Attachment)
