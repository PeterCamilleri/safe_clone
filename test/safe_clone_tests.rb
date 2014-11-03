# coding: utf-8

require_relative '../lib/safe_clone'
require          'minitest/autorun'

#Test the monkey patches applied to the Object class.
class SafeCloneTester < MiniTest::Unit::TestCase

  #Special initialize to track rake progress.
  def initialize(*all)
    $do_this_only_one_time = "" unless defined? $do_this_only_one_time

    if $do_this_only_one_time != __FILE__
      puts
      puts "Running test file: #{File.split(__FILE__)[1]}"
      $do_this_only_one_time = __FILE__
    end

    super(*all)
  end

  def test_for_safe_value_cloning
    assert_equal((6).safe_clone, 6)
    assert_equal((6).safe_clone.object_id, (6).object_id)

    assert_equal((:foo).safe_clone, :foo)
    assert_equal((:foo).safe_clone.object_id, (:foo).object_id)

    assert_equal((true).safe_clone, true)
    assert_equal((true).safe_clone.object_id, (true).object_id)

    assert_equal((false).safe_clone, false)
    assert_equal((false).safe_clone.object_id, (false).object_id)

    assert_equal((nil).safe_clone, nil)
    assert_equal((nil).safe_clone.object_id, (nil).object_id)

    rex = /ABC/
    assert_equal(rex.safe_clone, rex)
    assert_equal(rex.safe_clone.object_id, rex.object_id)
  end

  def test_for_reference_cloning
    str = "test"
    assert_equal(str.safe_clone, str)
    refute_equal(str.safe_clone.object_id, str.object_id)

    arra = [1,2,3]
    arrb = arra.safe_clone
    assert_equal(arrb, arra)
    refute_equal(arrb.object_id, arra.object_id)

    arrb << 4
    assert_equal([1,2,3],   arra)
    assert_equal([1,2,3,4], arrb)

    lam = lambda { puts 'hello world'}
    refute_equal(lam.safe_clone.object_id, lam.object_id)

  end

end
