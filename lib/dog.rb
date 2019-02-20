class Dog

  attr_accessor :name, :breed
  attr_reader :id

  def initialize (params)
    if params[:id]
      @id = params[:id]
    else
      @id = nil
    end
    #@id ||= params[:id]
    @name = params[:name]
    @breed = params[:breed]
  end

  def self.create_table
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        album breed
        )
        SQL
    DB[:conn].execute(sql)
  end

  def self.drop_table
    sql =  <<-SQL
      DROP TABLE IF EXISTS dogs
        SQL
    DB[:conn].execute(sql)
  end

  def save
    def save
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
  end
  end


end
