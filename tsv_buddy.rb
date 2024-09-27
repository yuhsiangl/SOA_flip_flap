# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  TAB = "\t"
  NEWLINE = "\n"

  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: nothing
  def take_tsv(tsv)
    lines = tsv.split(NEWLINE).map { |line| line.split(TAB) }
    keys = lines.first
    @data = lines[1..].map { |values| keys.zip(values).to_h }
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
    result = array_to_string(@data[0].keys)
    result + @data.map { |line| array_to_string(line.values) }.join
  end

  def array_to_string(arr)
    arr.join(TAB) + NEWLINE
  end
end
