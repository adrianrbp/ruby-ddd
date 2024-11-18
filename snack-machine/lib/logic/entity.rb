module Logic
  class Entity
    attr_reader :id

    def initialize(id = 0)
      @id = id
    end

    def ==(other)
      return false if other.nil?
      return true if equal?(other)
      return false if self.class != other.class
      return false if id.zero? || other.id.zero?

      id == other.id
    end

    alias eql? ==

    def hash
      "#{self.class}-#{id}".hash
    end
  end
end
