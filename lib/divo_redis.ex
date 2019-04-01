defmodule DivoRedis do
  @moduledoc """
  Defines a simple redis stack as a map compatible
  with divo for building a docker-compose file.
  """
  @behaviour Divo.Stack

  @doc """
  Implements the Divo Stack behaviour to take a
  keyword list of defined variables specific to
  the DivoRedis stack and returns a map describing the
  service definition of redis.
  """
  @impl Divo.Stack
  @spec gen_stack([tuple()]) :: map()
  def gen_stack(_envars) do
    %{
      redis: %{
        image: "redis:latest",
        ports: ["6379:6379"],
        healthcheck: %{
          test: ["CMD", "redis-cli", "PING"],
          interval: "5s",
          timeout: "10s",
          retries: 3
        }
      }
    }
  end
end
