class Dog

  attr_accessor :name, :breed

  def initialize (params)
    @id = params[:id]
    @name = params[:name]
    @breed = params[:breed]
  end

end
