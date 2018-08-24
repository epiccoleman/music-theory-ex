defmodule Music do
  @notes [ :c, :dbcs, :d, :ebds, :e, :f, :gbfs, :g, :abgs, :a, :bbas, :b, ]

  @intervals %{
    unison: 0,
    minor_2nd: 1,
    major_2nd: 2,
    minor_3rd: 3,
    major_3rd: 4,
    perfect_4th: 5,
    tritone: 6, # hail satan
    perfect_5th: 7,
    minor_6th: 8,
    major_6th: 9,
    minor_7th: 10,
    major_7th: 11,
    octave: 12,
  }

  @major_scale_formula [ #wwhwwwh
    :unison, :major_2nd, :major_3rd, :perfect_4th, :perfect_5th, :major_6th, :major_7th]
  @natural_minor_formula [ #whwwhww
    :unison, :major_2nd, :minor_3rd, :perfect_4th, :perfect_5th, :minor_6th, :minor_7th]

  def notes() do
    @notes
  end

  def intervals() do
    @intervals
  end

  def chromatic_scale(root) do
    shift_by = Enum.find_index(@notes, fn(x) -> x == root end)
    @notes
    |> Stream.cycle()
    |> Stream.drop(shift_by)
    |> Enum.take(12)
  end

  def note_for_interval(root, interval, :asc) do
    interval_semitones = @intervals[interval]
    chromatic_scale(root)
    |> Enum.at(interval_semitones)
  end

  def scale(formula, root) do
    formula
    |> Enum.map(fn(x) -> note_for_interval(root, x, :asc) end)
  end

  def major_scale(root) do
    scale(@major_scale_formula, root)
  end

  def minor_scale(root) do
    scale(@natural_minor_formula, root)
  end
end
