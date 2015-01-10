require 'rubygems/remote_fetcher'

class Gem::RemoteFetcher
  protected

  # Monkeypatch the broken sign_s3_url function
  def sign_s3_url(uri, expiration = nil)
    require 'base64'
    require 'openssl'

    id, secret = s3_source_auth uri.host

    expiration ||= s3_expiration
    canonical_path = "/#{uri.host}#{uri.path}"
    payload = "GET\n\n\n#{expiration}\n#{canonical_path}"
    digest = OpenSSL::HMAC.digest('sha1', secret, payload)
    # URI.escape is deprecated, and there isn't yet a replacement that does quite what we want
    signature = Base64.encode64(digest).gsub("\n", '').gsub(/[\+\/=]/) { |c| BASE64_URI_TRANSLATE[c] }
    URI.parse("https://#{uri.host}.s3.amazonaws.com#{uri.path}?AWSAccessKeyId=#{id}&Expires=#{expiration}&Signature=#{signature}")
  end

  def s3_source_auth(host)
    s3_source = Gem.configuration[:s3_source] || Gem.configuration['s3_source']
    raise FetchError.new('no s3_source key exists in .gemrc') unless s3_source
    auth = s3_source[host] || s3_source[host.to_sym]
    raise FetchError.new("no key for host #{host} in s3_source in .gemrc") unless auth
    id = auth[:id] || auth['id']
    secret = auth[:secret] || auth['secret']
    raise FetchError.new("s3_source for #{host} missing id or secret") unless id and secret
    [id, secret]
  end
end
