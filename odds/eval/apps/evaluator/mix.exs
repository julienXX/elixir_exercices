defmodule Evaluator.Mixfile do
  use Mix.Project

  def project do
    [ app: :evaluator,
      version: "0.0.1",
      deps: deps(ENV) ]
  end

  # Configuration for the OTP application
  def application do
    [ ]
  end

  defp deps(:test) do
     [ { :line_sigil, path: "../line_sigil" } ] ++ deps(:default)
  end

  defp deps(_) do
    []
  end
end
