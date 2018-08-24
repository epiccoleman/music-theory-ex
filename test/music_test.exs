defmodule MusicTest do
  use ExUnit.Case
  doctest Music

  test "c major" do
    assert Music.major_scale(:c) == [ :c, :d, :e, :f, :g, :a, :b ]
  end

  test "a minor" do
    assert Music.minor_scale(:a) == [ :a, :b, :c, :d, :e, :f, :g ]
  end
end
