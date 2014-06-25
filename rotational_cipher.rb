class RotationalCipher
  attr_accessor :numeric_message, :numeric_encoded_message, :encoded_message

  ALPHA = ("a".."z").to_a
  ALPHA_HASH = Hash[ALPHA.map.with_index.to_a]

  # Creates encoded message when passed integer and string
  def rotx(x, string, encrypt=true)
    numberfy(string)
    apply_cipher(x)

    if encrypt == true
      encode_message
      self.encoded_message.join
    else
      # TODO add decryption ability
      # self.decoded_message
    end
  end

  # Assigns numeric value to each letter of string and assembles as an Array
  def numberfy(string)
    @numeric_message = []
    message = string.split(//)
    message.each do |letter|
      number = ALPHA_HASH[letter]
      @numeric_message << number
    end
  end

  # Creates numeric encoded message based on cipher integer
  def apply_cipher(x)
    @numeric_encoded_message = []
    @numeric_message.each do |num|
      new_num = num + x
      @numeric_encoded_message << new_num
    end

    # ensures encoded number falls within correct range
    @numeric_encoded_message.collect! do |num|
      num > 26 ? (num - 26) : num
    end
  end

  # Replaces number value with corresponding letter value
  def encode_message
    @encoded_message = []
    @numeric_encoded_message.each do |num|
      new_letter = ALPHA_HASH.invert[num]
      @encoded_message << new_letter
    end
  end
end