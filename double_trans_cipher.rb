module DoubleTranspositionCipher
  def self.encrypt(document, key)
    # document = 'attackatdawn' # {testing stuff}
    # key = 55 # hard coded stuff remove later!
    test = document.chars
    m_size = Math.sqrt(test.length).ceil
    mat = test.each_slice(m_size).to_a
    col_order = (0..m_size - 1).to_a.shuffle(random: Random.new(key))
    row_order = (0..mat.length - 1).to_a.shuffle(random: Random.new(key))
    # create new array with rows in new order
    newmat = Array.new(mat.length)
    row_order.each_with_index do |var, index|
      newmat[index] = mat[var]
    end
    # move columns to new position
    newmat.each_with_index do |row, col_index|
      temp = []
      col_order.each_with_index do |sequence, index|
        temp[index] = row[sequence]
      end
      newmat[col_index] = temp
      puts temp
      # puts "this itaration row = #{row}"
    end
    newmat
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
  end
end
