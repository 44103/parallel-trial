defmodule Parallel do
  def main do
    2..(10 ** 6 - 1)
    |> Enum.map(&Task.async(Parallel, :prime, [&1]))
    |> Enum.map(&Task.await(&1))
  end

  def mods(x, n) do
    cond do
      x == n -> n
      rem(n, x) == 0 -> Nil
      x > n -> Nil
      true -> mods(x + 2, n)
    end
  end

  def prime(2), do: 2
  def prime(4), do: Nil
  def prime(n), do: mods(3, n)

  def timer do
    :timer.tc(Parallel, :main, [])
    |> elem(0)
    |> Kernel./(1_000_000)
  end
end
