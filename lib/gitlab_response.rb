require 'benchmark'
require 'net/http'
require 'uri'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class GitlabResponse
	def self.average_response
		url = URI.parse('https://gitlab.com')
		time = 0
		response_times = []
	
		while time < 300 do
			start = Time.now
			Net::HTTP.get(url)
			finish = Time.now
		
			response_time = finish - start
			response_times.push(response_time)
		
			time += 10
			sleep 10
		end
		
		average_time = response_times.inject(0){|sum,x| sum + x } / response_times.size.to_f
		puts "Average Response time of #{url} is #{average}ms"
	end
end