module MerryUrl
  
  #
  # == Synopsis
  #
  #   MerryUrl.tiny_url(url_str)
  #
  # == Args
  #
  # +url_str+::
  #   String with URI.
  #
  # == Description
  #
  # Generate a tiny_url from a long URL
  #  
  # == Raises
  #
  # MerryUrl::MerryUrlError
  #   Raised if something wrong during url shortening.
  #
  # == Usage
  #
  #   require 'merry_url'
  #
  #   short_uri = MerryUrl.tiny_url("http://www.google.fr")
  #   p short_uri
  #   # => http://tinyurl.com/6d3x"

  def self.tiny_url(uri) 
    begin
      valid_uri = MerryUrl.validate(uri)
      escaped_uri = URI.escape("http://tinyurl.com/api-create.php?url=#{valid_uri}")
      uri_parsed = Net::HTTP.get_response(URI.parse(escaped_uri)).body
      return uri_parsed
    rescue => e
      raise MerryUrlError.new("#{e}")
    end
  end
  
  def self.is_gd(uri)
    begin
      valid_uri = MerryUrl.validate(uri)
      escaped_uri = URI.escape("http://is.gd/api.php?longurl=#{valid_uri}")
      uri_parsed = Net::HTTP.get_response(URI.parse(escaped_uri)).body
      return uri_parsed
    rescue => e
      raise MerryUrlError.new("#{e}")
    end
  end
    
  def self.validate(url)
    begin
      uri = URI.parse(url)
      if uri.class != URI::HTTP
        raise MerryUrlError.new('Only HTTP protocol addresses can be used')
      end
      return uri
    rescue URI::InvalidURIError
      raise MerryUrlError.new('The format of the url is not valid.')
    end
  end
  
  class MerryUrlError < StandardError; end
  
end