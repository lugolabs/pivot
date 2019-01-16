require 'minitest/autorun'

class PivotIndexTest < Minitest::Test
  def test_can_handle_nil_array
    assert_equal -1, pivot(nil)
  end

  def test_can_handle_empty_array
    assert_equal -1, pivot([])
  end

  def test_can_handle_array_with_single_item
    assert_equal -1, pivot([0])
  end

  def test_can_handle_array_with_two_items
    assert_equal -1, pivot([0, 1])
  end

  def test_can_handle_array_with_single_index
    assert_equal 2, pivot([1, 4, 6, 3, 2])
  end

  def test_can_handle_array_with_two_indeces
    assert_equal 2, pivot([1, 4, 0, 0, 5, 0])
  end

  def pivot(arr)
    PivotIndex.pivot(arr)
  end
end


class PivotIndex
  def self.pivot(arr)
    return -1 if (arr || []).size < 3
    left_sum  = 0
    right_sum = arr.sum

    arr.each_with_index do |item, i|
      right_sum -= item
      return i if left_sum == right_sum
      left_sum += item
    end
    -1
  end
end
