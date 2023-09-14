
class ValidateSSN
    def validate(ssn)
      ssn = ssn.gsub(/[^0-9]/, '')
  
      return false unless ssn.length == 10
  
    
      birthdate = ssn[0, 6]
      last_four = ssn[6, 4]
  
     
      return calculate_checksum(birthdate, last_four);
    end
  
    def calculate_checksum(birthdate, last_four)
        digits = birthdate + last_four[0, 3]
        checksum = 0
      

        digits.each_char.with_index do |char, index|
          digit = char.to_i
      
          if index.even?
            digit *= 2
      

            digit -= 9 if digit > 9
          end
          

          checksum += digit
        end
      
        last_checksum = checksum*9%10
        last_control_digit = last_four[3,4]

        last_checksum.to_i == last_control_digit.to_i
      end
  end
  


ValidateSSN.new.validate("970409-3914")