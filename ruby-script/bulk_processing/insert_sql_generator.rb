


require "#{__dir__}/lib/insert_value"

class InsertSqlGenerator
  
  include InsertValue

  def initialize(yaml_path=nil)
    
    # 以下の値はymlから読み込み
    @size   = 10
    @bulk   = 3
    @table  = 'sample'
    @fields = {
      id: 'int:autoincrement', 
      number_field_a: 'int', 
      number_field_b: 'int:1000000:1999999', 
      character_field: 'string',
    }
    @path_output = "#{__dir__}/out/#{@table}.sql"

  end

  def generate
    
    File.open(@path_output, 'w') do |file|
      buffer = []
      @size.times do |i|
        buffer.push(values(i))
        if buffer.size >= @bulk
          file.write(generate_query(buffer))
          buffer = []
        end
      end
      file.write(generate_query(buffer)) unless buffer.empty?
    end

  end
  
  private

  def field_part_of
    "(#{@fields.keys.join(', ')})"
  end

  def generate_query(buffer)
    "INSERT INTO #{@table} #{field_part_of} VALUES #{ buffer.join(', ') } ;\n"
  end

end

if __FILE__ == $0
  InsertSqlGenerator.new.generate()
end

