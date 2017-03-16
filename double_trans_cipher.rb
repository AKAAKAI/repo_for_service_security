# Double transposition cipher
module DoubleTranspositionCipher
  def self.encrypt(document, key)
    matrix_rows = []
    m_size = Math.sqrt(document.to_s.chars.length).ceil
    matrix = document.to_s.chars.each_slice(m_size).to_a
    col_order = (0..m_size - 1).to_a.shuffle(random: Random.new(key))
    row_order = (0..matrix.length - 1).to_a.shuffle(random: Random.new(key))
    row_order.each { |e| matrix_rows << matrix[e] }
    matrix_columns = matrix_rows.map(&:dup)
    matrix_columns.each_with_index do |row, index|
      col_order.each_with_index do |e, i|
        row[i] = matrix_rows[index][e].nil? ? ' ' : matrix_rows[index][e]
      end
    end
    matrix_columns.join.to_s
  end

  def self.decrypt(ciphertext, key)
    m_size = Math.sqrt(ciphertext.to_s.chars.length).ceil
    matrix = ciphertext.to_s.chars.each_slice(m_size).to_a
    col_order = (0..m_size - 1).to_a.shuffle(random: Random.new(key))
    row_order = (0..matrix.length - 1).to_a.shuffle(random: Random.new(key))
    matrix_col = matrix.map(&:dup)
    matrix_rows = matrix.map(&:dup)
    matrix_col.each_with_index do |row, index|
      col_order.each_with_index { |e, i| row[e] = matrix_rows[index][i] }
    end
    row_order.each_with_index { |e, i| matrix_rows[e] = matrix_col[i] }
    matrix_rows.join.to_s.strip
  end
end
