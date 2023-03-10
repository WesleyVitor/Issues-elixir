defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,
      escript: escript_config(),
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def escript_config() do
    [
      main_module: Issues.CLI
    ]
  end
  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0.0"},
      {:poison, "~>3.1"},
      {:ex_doc, "~> 0.29.1"}, # ExDoc
      {:earmark, "~> 1.4"}, #Convertor to html
    ]
  end
end
