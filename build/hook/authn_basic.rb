user_list = {
  :test => 'password'
}
realm_name = 'Private Page'

hin = Nginx::Headers_in.new

def authenticate_with(realm_name)
  hout = Nginx::Headers_out.new
  hout["WWW-Authenticate"] = %Q(Basic realm="#{realm_name}")
  Nginx.return Nginx::HTTP_UNAUTHORIZED
end

def valid_credentials?(credentials)
  return unless credentials.respond_to?(:match)
  credentials.match(/Basic\s+(.+)\z/) do |str|
    Base64::decode(str[1]).split(':')
    user_list[user_name.chomp.to_sym] == password.chomp
  end
end

if !hin["Authorization"].nil?
  if valid_credentials? hin["Authorization"]
    Nginx.echo 'Success authentication !'
    Nginx.return Nginx::DECLINED
  else
    Nginx.return Nginx::HTTP_UNAUTHORIZED
  end
else
  authenticate_with realm_name
end
