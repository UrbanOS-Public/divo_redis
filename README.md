# DivoRedis

A library implementing the Divo Stack behaviour, providing a pre-configured redis
via docker-compose for integration testing Elixir apps. The cluster is a
single-node redis compose stack that neither requires (nor accepts) no further configuration.

Requires inclusion of the Divo library in your mix project.

## Installation

The package can be installed by adding `divo_redis` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:divo, "~> 1.1", organization: "smartcolumbus_os"},
    {:divo_redis, "~> 0.1.0", organization: "smartcolumbus_os"}
  ]
end
```

## Use

In your Mix environment exs file (i.e. config/integation.exs), include the following:
```elixir
config :myapp,
  divo: [
    {DivoRedis, []}
  ]
```

Then you may use the mix tasks `mix docker.start`, `mix docker.stop`, and `mix docker.kill`
to manually stand up the stack for debugging or interacting via IEx, or include the
use directly in your integration tests by adding `use Divo` to the top of any test files
that will serve for integration testing.

The resulting stack will create a single-node Redis instance exposing port 6379
to the host.

### Configuration

DivoRedis takes no configuration.

See [Divo](https://github.com/smartcolumbusos/divo) for more instructions on using and
configuring the Divo library.
See [antirez/redis](https://github.com/antirez/redis) for further documentation on using
and configuring the features of these images.

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/divo_kafka](https://hexdocs.pm/divo_redis).
