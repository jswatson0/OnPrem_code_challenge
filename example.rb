class Example
  $ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  $alphabet = 'abcdefghijklmnopqurstvwxyz'

# Get an index of an alphabetic letter based on the index and offset
  def calculateOffset(index, offset)
    index += offset
    index -= 26 while index >= 26 # keep subtracting until we get to the right range
    index
  end

# Get a char from the alphabet based on an offset
  def getCharByOffset(char, offset=0)
    # Chars could be in the upper alphabet, the lower alphabet, or neither.
    indexUpper = $ALPHABET.index(char)
    indexLower = $alphabet.index(char)
    if indexUpper
      i = calculateOffset(indexUpper, offset)
      char = $ALPHABET[i] # Get the char at that index
    elsif indexLower
      i = calculateOffset(indexLower, offset)
      char = $alphabet[i]
    end
    char
  end

# Rotationally encode a string
  def rotx(x, string, encrypt=true)
    newString = ''
    x = -x unless encrypt
    # for each char in the string
    string.each_char do |char|
      # TODO: support decryption
      newString << getCharByOffset(char, x)
    end
    # get a new char that is `x` away in the alphabet
    newString
  end
end