module Valid
  
  module InstanceMethods
    def valid?
      validate!
    rescue
      false
    end
  end

  def self.included(receiver)
    receiver.send :include, InstanceMethods
  end
end
