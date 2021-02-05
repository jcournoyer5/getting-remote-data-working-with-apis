require 'net/http'
require 'open-uri'
require 'json'

#We can use require statements to include libraries of code in our own programs. 
#We can require libraries like NET::HTTP, or we can require gems, like Pry.
 
class GetPrograms

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"
  #stored our API endpoint URL in a constant at the top of our class

  def get_programs
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  
  def program_school
# we use the JSON library to parse the API response into nicely formatted JSON
  programs = JSON.parse(self.get_programs)
  programs.collect do |program|
    program["agency"]  
  end
  end


end

# programs = GetPrograms.new.get_programs
# puts programs

programs = GetPrograms.new
puts programs.program_school.uniq

#get_programs method that uses the NET::HTTP library to send an HTTP request from our program. 
#NET::HTTP is a Ruby library that allows your program or application to send HTTP requests. 
#We require it at the top of our file with the require statement. 
#We also require the URI library which helps Ruby to handle URIs.