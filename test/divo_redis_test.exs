defmodule DivoRedisTest do
  use ExUnit.Case

  describe "produces a redis stack map" do
    test "produces a redis" do
      expected = %{
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

      actual = DivoRedis.gen_stack([])

      assert actual == expected
    end
  end
end
