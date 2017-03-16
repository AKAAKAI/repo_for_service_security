# Double transposition cipher
module DoubleTranspositionCipher
  def self.encrypt(document, key)
    chars_a = document.to_s.chars
    m_size = Math.sqrt(chars_a.length).ceil
    matrix = chars_a.each_slice(m_size).to_a
    col_order = (0..m_size - 1).to_a.shuffle(random: Random.new(key))
    row_order = (0..matrix.length - 1).to_a.shuffle(random: Random.new(key))
    matrix_rows = []
    row_order.each { |e| matrix_rows << matrix[e] }
    matrix_columns = matrix_rows.map(&:dup)
    matrix_columns.each_with_index do |row, index|
      col_order.each_with_index do |e, i|
        chr = matrix_rows[index][e]
        row[i] = chr.nil? ? ' ' : chr
      end
    end
    matrix_columns.join.to_s
  end

  def self.decrypt(ciphertext, key)
    chars_a = ciphertext.to_s.chars
    m_size = Math.sqrt(chars_a.length).ceil
    matrix = chars_a.each_slice(m_size).to_a
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
