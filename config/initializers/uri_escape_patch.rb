require 'uri'

module URI
  # Definiamo URI.escape(str, unsafe_pattern) per compatibilità con Paperclip
  def self.escape(str, unsafe = /[^a-zA-Z0-9\-\_\.\!\~\*\'\(\)]/)
    str.to_s.gsub(unsafe) { |chr| sprintf("%%%02X", chr.ord) }
  end
end