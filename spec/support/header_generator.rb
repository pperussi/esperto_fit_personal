module HeaderGenerator
    def new_header
      payload = {
        user_id: 1, token_type: 'client_a2', exp: 1572648736
      }
      token = Auth.issue(payload)
      byebug
      headers = {
        'Token' => token,
        'Accept' => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type' => 'application/json',
        'User-Agent'=>'Faraday v0.17.0'
      }
      headers
        
    end
  
    def user_header(user)
      payload = {
        user_id: user.id, token_type: 'client_a2', exp: 4.hours.from_now.to_i
      }
      token = Auth.issue(payload)
      headers = {
        'Token' => token,
        'Accept' => '*/*',
        'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
        'Content-Type' => 'application/json',
        'User-Agent'=>'Faraday v0.17.0'
      }
      headers
    end
end