require 'httparty'

# Problem 1
def prob1
    city = 'Memphis'
    my_api_key = '0ce4e86cbcf747aaa39215703241904'
    time = Date.new(2024, 4, 1)

    # get request
    response = HTTParty.get("http://api.weatherapi.com/v1/forecast.json?key=#{my_api_key}&q=#{city}&days=1&aqi=no&alerts=no")

    # extracting data
    hour_data = response['forecast']['forecastday'][0]['hour']
    hour_temps = hour_data.map { |hour| hour['temp_f'] }
    feels_like = hour_data.map { |hour| hour['feelslike_f'] }
    hour_humidities = hour_data.map { |hour| hour['humidity'] }

    # calculating average temperature
    avg_temp = hour_temps.sum/hour_temps.size
    puts "The average temperature for the day is: #{avg_temp}"
    # average "feels like" temperature just for funsies
    avg_feels_like = feels_like.sum/feels_like.size
    puts "But the average felt more like: #{avg_feels_like}"

end
# puts prob1

# Problem 2
def prob2

    my_api_key = '73f8e735f5cfa29de5d1d481ed6e4d45'
    sc = 'USD'
    tc = 'CAD'
    amt = 100
    # get request to find the exchange rate
    response = HTTParty.get("http://api.exchangeratesapi.io/v1/latest?access_key=#{my_api_key}&symbols=#{sc},#{tc}")
    # puts response
    
    # calculate the exchange
    response['rates'][tc] * amt
end
puts prob2