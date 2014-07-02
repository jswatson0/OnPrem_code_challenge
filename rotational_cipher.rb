class RotationalCipher
  attr_accessor :numeric_message, :numeric_encoded_message, :encoded_message, :decoded_message,
                :numeric_decoded_message

  ALPHA = ("a".."z").to_a
  ALPHA_HASH = Hash[ALPHA.map.with_index.to_a]

  # Creates encoded message when passed integer and string
  def initialize
    @numeric_message = []
    @numeric_encoded_message = []
    @encoded_message = []
    @numeric_decoded_message = []
    @decoded_message = []
  end

  def rotx(x, string, encrypt=true)
    numberfy(string)

    if encrypt == true
      apply_cipher(x)
      encode_message
    else
      reverse_cipher(x)
      decode_message
    end
  end

  # Assigns numeric value to each letter of string and assembles as an Array
  def numberfy(string)
    message = string.downcase.split(//)
    message.each do |char|
      (ALPHA.include? char) ? number = ALPHA_HASH[char] : number = char
      @numeric_message << number
    end
  end

  # Creates encoded numeric message based on cipher integer
  def apply_cipher(x)
    @numeric_message.each do |char|
      if char.class == Fixnum
        char += x
        char -= 26 while char >= 26
      else
        char
      end
      @numeric_encoded_message << char
    end
  end

  def reverse_cipher(x)
    @numeric_message.each do |char|
      if char.class == Fixnum
        char -= x
        (char > 26) ? (char -= 26 while char >= 26) : char += 26 while char < 0
      else
        char
      end
      @numeric_decoded_message << char
    end
  end

  # Replaces number value with corresponding letter value
  def encode_message
    self.convert(@numeric_encoded_message, @encoded_message)
  end

  def decode_message
    self.convert(@numeric_decoded_message, @decoded_message)
  end

  def convert(numeric_message, alpha_message)
    numeric_message.each do |char|
      (char.class == Fixnum) ? new_letter = ALPHA_HASH.invert[char] : new_letter = char
      alpha_message << new_letter
    end
    alpha_message.join
  end
end