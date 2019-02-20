class Dog

  attr_accessor :name, :breed, :id

  def initialize (id: nil, name:, breed:)
    @id = id
    @name = name
    @breed = breed
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
    sql = <<-SQL
      INSERT INTO dogs (name, breed)
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
    self
  end

  def self.create(attributes)
    dog = Dog.new(attributes)
    dog.save
    dog
  end

  def self.find_by_id(id)
   sql = "SELECT * FROM dogs WHERE id = ? LIMIT 1"
   result = DB[:conn].execute(sql, id)[0]
   Dog.new(id: result[0], name: result[1], breed: result[2])
  end

  def self.find_or_create_by(attributes)
    dog = DB[:conn].execute("SELECT * FROM dogs WHERE name = ? AND breed = ?", attributes[:name], attributes[:breed])
    if !dog.empty?
      dogdata = dog[0]
      dog = Dog.new(id: dogdata[0], name: dogdata[1], breed: dogdata[2])
    else
      dog = self.create(name: attributes[:name], breed: attributes[:breed])
    end
    dog
  end

  def self.new_from_db(row)
    dog = Dog.new(id: row[0], name: row[1], breed: row[2])
  end

  def self.find_by_name(name)
    sql = "SELECT * FROM dogs WHERE name = ? LIMIT 1"
    result = DB[:conn].execute(sql, name)[0]
    Dog.new(id: result[0], name: result[1], breed: result[2])
  end

  def update
    sql = "UPDATE songs SET name = ?, album = ? WHERE id = ?"
    DB[:conn].execute(sql, self.name, self.album, self.id)
  end



end
