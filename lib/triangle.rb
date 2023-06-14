class Triangle

  attr_accessor :kind

  :equilateral
  :isosceles
  :scalene

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    sides = [@side1, @side2, @side3].sort

    if sides[0]+sides[1] > sides[2]
      if @side1 && @side2 && @side3 >= 0
          if (@side1 == @side2 && @side2 == @side3)
            :equilateral
          elsif (@side1 == @side2 || @side2 == @side3 || @side3 == @side1)
            :isosceles
          elsif (@side1 != @side2 || @side2 != @side3 || @side3 != @side1)
            :scalene
          else 
            raise TriangleError, "Is not a real Triangle"
          end  
      else 
        raise TriangleError, "At least one side is less than 0"
      end
    else
      raise TriangleError, "Triangle Inequality"
    end
  end

  class TriangleError < StandardError
    def message
      "Triangle has no size!"
    end
  end

end
