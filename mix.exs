defmodule BugspotsEx.Mixfile do
  use Mix.Project

  def project do
    [app: :bugspots_ex,
     version: "0.0.1",
     elixir: "~> 1.1",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:libgit2, github: "libgit2/libgit2", app: false, compile: "mkdir -p build && cd build && cmake .. && cmake --build . --target install"},
      {:geef, github: "carlosmn/geef", ref: "28e890ca9573184ac5d83fb65ccc7dd6afa94fe8"}
    ]
  end
end
