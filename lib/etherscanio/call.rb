module Etherscanio
  class Call
    attr_accessor :mod, :action
    def initialize(mod, action)
      @mod = mod
      @action = action
    end

    def to_s
      'module=' + mod + '&action=' + action
    end
  end
end
