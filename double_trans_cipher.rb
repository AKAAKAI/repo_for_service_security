module DoubleTranspositionCipher
  @col_order = []
  @row_order = []
  def self.encrypt(document, key)
    # TODO: FILL THIS IN!
    ## Suggested steps for double transposition cipher
    # 1. find number of rows/cols such that matrix is almost square
    # 2. break plaintext into evenly sized blocksr
    # 3. sort rows in predictibly random way using key as seed
    # 4. sort columns of each row in predictibly random way
    # 5. return joined cyphertext
    chars_a = document.to_s.chars
    m_size = Math.sqrt(chars_a.length).ceil
    matrix = chars_a.each_slice(m_size).to_a
    @col_order = (0..m_size - 1).to_a.shuffle(random: Random.new(key))
    @row_order = (0..matrix.length - 1).to_a.shuffle(random: Random.new(key))
    matrix_rows_shuffle = []
    @row_order.each { |e| matrix_rows_shuffle << matrix[e] }
    matrix_columns_shuffle = matrix_rows_shuffle.map(&:dup)
    matrix_columns_shuffle.each_with_index do |row, index| 
      @col_order.each_with_index do |e, i| 
        chr = matrix_rows_shuffle[index][e]
        matrix_columns_shuffle[index][i] = chr.nil? ? ' ' : chr
      end
    end
    matrix_columns_shuffle.join().to_s
  end

  def self.decrypt(ciphertext, key)
    # TODO: FILL THIS IN!
    chars_a = ciphertext.to_s.chars
    m_size = @col_order.length
    matrix = chars_a.each_slice(m_size).to_a
    matrix_columns_ordered = matrix.map(&:dup)
    matrix_rows_ordered = matrix.map(&:dup)
    matrix_columns_ordered.each_with_index do |row, index|
      @col_order.each_with_index do |e, i|
        matrix_columns_ordered[index][e] = matrix_rows_ordered[index][i]
      end
    end
    @row_order.each_with_index do |e, i|
      matrix_rows_ordered[e] = matrix_columns_ordered[i]
    end
    matrix_rows_ordered.join.to_s.strip
  end
end
