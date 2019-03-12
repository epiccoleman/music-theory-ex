defmodule MusicTest do
  use ExUnit.Case
  doctest Music

  test "c major" do
    assert Music.major_scale(:c) == [ :c, :d, :e, :f, :g, :a, :b ]
  end

  test "a minor" do
    assert Music.minor_scale(:a) == [ :a, :b, :c, :d, :e, :f, :g ]
  end

  test "note for interval" do
    assert Music.note_for_interval(:c, :minor_2nd, :asc) == :csdb
    assert Music.note_for_interval(:c, :major_2nd, :asc) == :d
    assert Music.note_for_interval(:c, :minor_3rd, :asc) == :dseb
    assert Music.note_for_interval(:c, :perfect_5th, :asc) == :g
    assert Music.note_for_interval(:c, :octave, :asc) == :c
  end

  test "c major chord" do
    assert Music.major_chord(:c) == [ :c, :e, :g ]
  end

  test "a minor chord" do
    assert Music.minor_chord(:a) == [ :a, :c, :e ]
  end
end
