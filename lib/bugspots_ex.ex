defmodule BugspotsEx do

  alias Geef.Repository
  alias Geef.Reference

  def repo(path) when is_bitstring(path), do: get_repo Repository.open(path)
  def repo(path), do: get_repo Repository.open(path)
  def repo, do: get_repo Repository.open(".")

  defp get_repo({:ok, pid}), do: pid
  defp get_repo({:error, message}), do: IO.puts message
end
