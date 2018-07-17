unless function_exported?(Bunyan.Shared.Build, :__info__, 1),
do: Code.require_file("shared_build_stuff/mix.exs")

alias Bunyan.Shared.Build

defmodule Bunyan.MixProject do
  use Mix.Project

  def project() do
    Build.project(
      :bunyan,
      &deps/1,
      """
      An all-plugins-included version of the Bunyan distributed and pluggable
      logging system. (Thanks to Benjamin Coppock for letting me steal his
      project name)
      """
    )
  end

  def application(), do: []

  def deps(_) do
    [
      bunyan:  [
        bunyan_core:                        ">= 0.5.0",
        bunyan_formatter:                   ">= 0.5.0",
        bunyan_shared:                      ">= 0.5.0",
        bunyan_source_api:                  ">= 0.5.0",
        bunyan_source_erlang_error_logger:  ">= 0.5.0",
        bunyan_source_remote_reader:        ">= 0.5.0",
        bunyan_writer_device:               ">= 0.5.0",
        bunyan_writer_remote:               ">= 0.5.0",
      ],
      others:  [],
    ]
  end

end
