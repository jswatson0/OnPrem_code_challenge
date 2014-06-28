class RotationalCipher
  attr_accessor :numeric_message, :numeric_encoded_message, :encoded_message, :decoded_message, :numeric_decoded_message

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
      self.encoded_message.join
    else
      # TODO add decryption ability
      reverse_cipher(x)
      decode_message
      self.decoded_message.join
    end
  end

  # Assigns numeric value to each letter of string and assembles as an Array
  def numberfy(string)
    message = string.split(//)
    message.each do |letter|
      number = ALPHA_HASH[letter]
      @numeric_message << number
    end
  end

  # Creates encoded numeric message based on cipher integer
  def apply_cipher(x)
    @numeric_message.each do |num|
      num += x
      num -= 26 while num >= 26
      @numeric_encoded_message << num
    end
  end

  def reverse_cipher(x)
    @numeric_message.each do |num|
      num -= x
      if num > 26
        num -= 26 while num >= 26
      else
        num += 26 while num < 0
      end
      @numeric_decoded_message << num
    end
  end

  # Replaces number value with corresponding letter value
  def encode_message
    @numeric_encoded_message.each do |num|
      new_letter = ALPHA_HASH.invert[num]
      @encoded_message << new_letter
    end
  end

  def decode_message
    @numeric_decoded_message.each do |num|
      new_letter = ALPHA_HASH.invert[num]
      @decoded_message << new_letter
    end
  end
end