class UnsplashService

  def self.get_background(location)
    response = conn.get('/search/photos?') do |req|
      req.params['query'] = location
      req.params['count'] = 1
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results][0]
  end

  private
  def self.conn
    conn = Faraday.new 'https://api.unsplash.com' do |conn|
      conn.params['client_id'] = ENV['UNSPLASH_API_KEY']
    end
  end
end
