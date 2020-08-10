# Rules Class
class Rule
  def initialize(code, percent, threshold, value)
    @code, @percent, @threshold = code, percent, threshold
    @value = percent ? value/100.00 : value
  end

  # accessor methods
  #get rules code
  def getCode
    @code
  end

  #get rules percent
  def getPercent
    @percent
  end

  #get rules threshold
  def getThres
    @threshold
  end

  #get rules value
  def getVal
    @value
  end
end