# This module is for double transposition
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
    end
    newmat
  end

  def self.decrypt(ciphertext, key)
    ciphertext = 'dnwaaattctak'
    key = 55
    test = ciphertext.chars
    m_size = Math.sqrt(test.length).ceil
    mat = test.each_slice(m_size).to_a
    col_order = (0..m_size - 1).to_a.shuffle(random: Random.new(key))
    row_order = (0..mat.length - 1).to_a.shuffle(random: Random.new(key))
    # create new array with rows in new order
    newmat = Array.new(mat.length)
    # move columns to new position
    mat.each_with_index do |row, col_index|
      temp = []
      col_order.each_with_index do |sequence, index|
        temp[index] = row[sequence]
      end
      mat[col_index] = temp
    end
    # create new array with rows in new order
    row_order.each_with_index do |var, index|
      newmat[var] = mat[index]
    end
    # TODO: FILL THIS IN!
  end
end
