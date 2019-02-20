class Dog

  attr_accessor :name, :breed

  def initialize (params)
    if params[:id]
      @id = params[:id]
    else
      @id = nil
    end
    @id ||= params[:id]
    @name = params[:name]
    @breed = params[:breed]
  end

end
