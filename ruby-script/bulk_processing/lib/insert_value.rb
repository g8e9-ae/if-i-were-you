


#
# Handling many kind of values
#
module InsertValue
  
  DEFAULT_INT_VALUE_RANGE   = 10
  DEFAULT_MAX_STRING_LENGTH = 10

  #
  # removing case statement may best, is it?
  # add type you want here
  #
  def values(current_row)
    values = @fields.values.map do |definition|
      case definition
      when /int\:autoincrement/
        current_row
      when /int\:[0-9]*\:[0-9]*/
        parts = definition.split(':')
        rand(parts[1].to_i..parts[2].to_i)
      when 'int'
        rand(DEFAULT_INT_VALUE_RANGE)
      when 'string'
        "'#{ (1..DEFAULT_MAX_STRING_LENGTH).map { ('a'..'z').to_a[rand(26)] }.join }'"
      else
        "'**** error[#{definition}] ****'"
      end
    end

    "(#{values.join(', ')})"
  end

end
