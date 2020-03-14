gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/pirate'

class PirateTest < Minitest::Test
  def test_has_name
    pirate = Pirate.new("Jack")
    assert_equal "Jack", pirate.name
  end

  def test_can_have_different_name
    pirate = Pirate.new("Blackbeard")
    assert_equal "Blackbeard", pirate.name
  end

  def test_is_a_scallywag_by_default
    pirate = Pirate.new("Jack")
    assert_equal 'Scallywag', pirate.job
  end

  def test_in_not_always_a_scallywag
    pirate = Pirate.new("Jack", "Cook")
    assert_equal "Cook", pirate.job
  end

  def test_isnt_cursed_by_default
    pirate = Pirate.new("Jack")
    refute pirate.cursed?
  end

  def test_becomes_cursed_after_enough_heinous_acts
    pirate = Pirate.new("Jack")
    refute pirate.cursed?
    pirate.commit_heinous_act
    refute pirate.cursed?
    pirate.commit_heinous_act
    refute pirate.cursed?
    pirate.commit_heinous_act
    assert pirate.cursed?
  end

  def test_a_pirate_has_booty
    pirate = Pirate.new("Captain Jack")
    assert_equal 0, pirate.booty
    # create a pirate
    # check that the pirate starts with 0 booty
  end

  def test_a_pirate_gets_100_booty_for_robbing_ships
    pirate = Pirate.new("Captain Jack")
    3.times do
      pirate.rob_ship
    end
    assert_equal 300, pirate.booty
    assert pirate.cursed?

    # create a pirate
    # rob some ships
    # check that the pirate got 100 booty for each ship it robbed
  end

end
