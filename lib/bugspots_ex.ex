defmodule BugspotsEx do

  alias Geef.Repository
  alias Geef.Reference

  @master "refs/heads/master"

  def repo!(path), do: get_repo Repository.open(path)
  def repo!, do: repo!(".")

  defp get_repo({:ok, pid}), do: pid
  defp get_repo({:error, message}), do: message

  def references!(path) do
    case Repository.open(path) do
      {:ok, pid} -> Repository.reference_names(pid)
      {:error, message} -> message
    end
  end
  def references!, do: references!(".")

  def oid!(path, branch \\ @master) do
    case Repository.open(path) do
      {:ok, pid} -> Geef.Reference.dwim(pid, branch)
      {:error, message} -> message
    end
  end
end
