require "minitest/autorun"
require_relative "../lib/logic/entity"

module Logic
  class EntityTest < Minitest::Test
    def setup
      @entity1 = Entity.new(1)
      @entity2 = Entity.new(1)
      @entity3 = Entity.new(2)
      @entity_nil_id = Entity.new(0)
    end

    def test_equality_with_same_id
      assert_equal @entity1, @entity2, "Entities with the same ID should be equal"
    end

    def test_inequality_with_different_id
      refute_equal @entity1, @entity3, "Entities with different IDs should not be equal"
    end

    def test_equality_with_itself
      assert_equal @entity1, @entity1, "An entity should be equal to itself"
    end

    def test_inequality_with_nil
      refute @entity1 == nil, "An entity should not be equal to nil"
    end

    def test_inequality_with_different_class
      other_class = Struct.new(:id).new(1)
      refute_equal @entity1, other_class, "Entities should not be equal to objects of a different class"
    end

    def test_inequality_with_zero_id
      refute_equal @entity1, @entity_nil_id, "Entities with ID of 0 should not be equal"
    end

    def test_hash_equality
      assert_equal @entity1.hash, @entity2.hash, "Entities with the same ID should have the same hash"
    end

    def test_hash_inequality
      refute_equal @entity1.hash, @entity3.hash, "Entities with different IDs should have different hashes"
    end
  end
end

