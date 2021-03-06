require_relative 'station'

class Oystercard
  attr_reader :balance, :entry_station, :journeys

MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journeys = {}
  end

  def top_up(amount)
    raise 'Balance cannot exceed £90' if @balance + amount > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    raise 'Card balance is too low' if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_BALANCE)
    @journeys[@entry_station] = exit_station
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
