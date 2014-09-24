require "paperclip/globalize3/version"
require "paperclip/globalize3/attachment"

require "globalize"
require "paperclip"

Paperclip.interpolates(:locale) { |_, _| Globalize.locale.to_s }

Paperclip::Attachment.send(:include, Paperclip::Globalize3::Attachment)
