module SubstitutionCipher
  module Caesar
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.encrypt(document, key)
      # TODO: encrypt string using caesar cipher
      nums_a = document.to_s.chars.map { |e| e = (e.ord + key).chr }

      return nums_a.join()
      
      
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using caesar cipher
      nums_a = document.to_s.chars.map { |e| e = (e.ord - key).chr }

      return nums_a.join()

    end
  end

  module Permutation
    # Encrypts document using key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    @a = []
    def self.encrypt(document, key)
      # TODO: encrypt string using a permutation cipher
      @a = (0..127).to_a.shuffle.first(26)
      nums_a = document.to_s.chars.map { |e| e = @a[(e.ord - 97)].to_i.chr }
      
      return nums_a.join()
    end

    # Decrypts String document using integer key
    # Arguments:
    #   document: String
    #   key: Fixnum (integer)
    # Returns: String
    def self.decrypt(document, key)
      # TODO: decrypt string using a permutation cipher
      puts "===="
      puts document
      puts "===="
      nums_a = document.to_s.chars.map { |e| e = (@a.index(e).to_i + 97).chr }
      
      

      
      
      
      
    end
  end
end
