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



end
