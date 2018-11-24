defmodule Cards do
  def create_deck do
    values = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "Jack",
      "Queen",
      "King"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]
    # Nested comprehensions
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  # Enumerable
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    # pattern matching
    # {hand, rest_of_cards} = Enum.split(deck, hand_size)
    Enum.split(deck, hand_size)
  end

  # Using Erlang to save to files
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  # Using Erlang, case statements and patter nmatching to load file and handle errors
  def load(filename) do
    # {status, binary} = File.read(filename)

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    # deck = Cards.create_deck()
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)

    # When using the  |> (pipe and greater than) operator
    # Return value is passed on the the next function as the first argument
    # IMPORTANT => first argument must be consistent!
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
