require 'readline'
require 'date'

# CONSTANTS
DATA_START_DATE = '2006-09-20'  #date at which data collection started
MAX_DAYS = 7

def query_user_for_date_range
  start_date = nil
  end_date = nil

  until start_date && end_date

    puts "\nFirst, we need a start date."
    start_date = query_user_for_date('START:')

    puts "\nNext, we need an end date."
    end_date = query_user_for_date('END:')

    if !date_range_valid?(start_date,end_date)
      puts "Date range not valid..try again"
      start_date = end_date = nil
    end

    end
    return start_date, end_date

end

def query_user_for_date(parm)
  date = nil
  until date.is_a? Date
    prompt = "Please enter a #{parm} date as YYYY-MM-DD format:"
    response = Readline.readline(prompt,true)

    exit if['quit','exit','q', 'x'].include?(response)

    begin
      date = Date.parse(response)
    rescue ArgumentError
      puts "\n You have entered an Invalid date OR format..."
    end
    date = nil unless date_valid?(date)
  end
  return date
end

def date_valid?(date)
  valid_dates = Date.parse(DATA_START_DATE)..Date.today
  if valid_dates.cover?(date)
    return true
  else
    puts"\n Date must be after #{DATA_START_DATE} and before #{Date.today} which is today's date."
    return false
  end
end

def date_range_valid?(start_date,end_date)
  if start_date > end_date
    puts"\nStart date #{start_date}must be BEFORE end date #{end_date}"
    return false
  elsif
    start_date + MAX_DAYS < end_date
    puts "\nNo more than #{MAX_DAYS} days of date can be requested as a courtesy to the Navy server."
    return false
  end
  return true
end
