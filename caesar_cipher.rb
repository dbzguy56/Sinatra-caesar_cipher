require 'sinatra'

def caesar_cipher(phrase, shift_factor)
  arr = phrase.split("")
  count = 0
  arr.each do |letter|
    if letter == letter[/[a-zA-Z]+/]
      shift_calc = letter.ord + shift_factor
      if (letter.ord > 96 && letter.ord < 123 && shift_calc > 122) ||  (letter.ord > 64 && letter.ord < 91 && shift_calc > 90)
        letter = (shift_calc-26).chr
      else
        letter = shift_calc.chr
      end
    end
    arr[count] = letter
    count += 1
  end
  arr.join
end

get '/' do
  message = params["cipher_message"]
  factor = params["cipher_factor"].to_i
  if message != nil
    secret_message = caesar_cipher(message, factor)
  end
  erb :index, :locals => {:secret_message => secret_message}
end
