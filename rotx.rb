class Rotx

  attr_accessor :numeric_message, :numeric_encoded_message, :encoded_message, :decoded_message

  ALPHA = ("a".."z").to_a
  ALPHA_HASH = Hash[ALPHA.map.with_index.to_a]

  def encryptor(x, string, encrypt=true)
    numberfy(string)
    apply_cypher(x)


    # self.encoded_message.join

    if encrypt == true
      encode_message
      self.encoded_message.join
    else
      @decoded_message = []
      @numeric_message.each do |num|
        new_letter = ALPHA_HASH.invert[num]
        @decoded_message << new_letter
      end
      self.decoded_message.join
    end
  end

  def numberfy(string)
    message = string.split(//)
    @numeric_message = []

    message.each do |letter|
      number = ALPHA_HASH[letter]
      @numeric_message << number
    end
  end

  def apply_cypher(x)
    @numeric_encoded_message = []

    @numeric_message.each do |num|
      new_num = num + x
      @numeric_encoded_message << new_num
    end

    @numeric_encoded_message.collect! do |num|
        num > 26 ? (num - 26) : num
    end
  end

  def encode_message
    @encoded_message = []

    @numeric_encoded_message.each do |num|
      new_letter = ALPHA_HASH.invert[num]
      @encoded_message << new_letter
    end
    @encoded_message.join
  end
end