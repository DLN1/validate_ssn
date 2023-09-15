
class ValidateSSN
    def validate(ssn)
      ssnLength = ssn.length
      return false unless ssnLength == 11 || ssnLength == 13

      birthdate = (ssnLength == 11) ? ssn.split("-")[0] : ssn.split("-")[0][2, 6]
      last_four = ssn.split("-")[1]
      puts birthdate
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



puts ValidateSSN.new.validate("970409-3914") ? "The SSN is valid" : "The SSN is invalid"
