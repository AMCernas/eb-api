require 'uri'
require 'net/http'
require 'json'

class Request
    def self.properties
        url = URI("https://api.stagingeb.com/v1/properties")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(url)
        request["accept"] = 'application/json'
        request["X-Authorization"] = 'l7u502p8v46ba3ppgvj5y2aad50lb9'

        response = http.request(request)
        JSON.parse(response.read_body)
    end
end

def get_titles(data)
    data["content"].map { |property| property["title"] }
end

def main
    data = Request.properties
    titles = get_titles(data)
    puts titles
end

main()