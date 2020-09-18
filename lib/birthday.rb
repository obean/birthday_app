require 'date'
require 'time_difference'
class Birthday
  attr_reader :name, :birthday, :today
  def initialize(name, date)
    @name = name
    @birthday = date 
    @today = Time.now.strftime("%Y-%m-%d")
  end

  def birthday?
    @birthday.chars.last(5) == @today.chars.last(5)
  end
  
  def age
    birth_year = @birthday[0..3].to_i 
    this_year = @today[0..3].to_i
    this_year - birth_year 
  end

  def days_til_birthday
    
    today= Date.parse(@today)
    birthday= Date.parse(@birthday.gsub(/\d\d\d\d/, Time.now.year.to_s))
   # days = TimeDifference.between(birthday, today).in_days
    if birthday > today
      365 - TimeDifference.between(birthday, today).in_days.floor
    elsif birthday < today
      TimeDifference.between(birthday, today).in_days.floor
    end
    
=begin 
    if days > 365
     days - 365
    else 
      days
    end
=end    
  end


  def birthday_message
    if birthday?
      "Happy Birthday! You are #{age} years old!"
    else 
      "You have to wait #{days_til_birthday} days till your birthday"
    end
  end
end