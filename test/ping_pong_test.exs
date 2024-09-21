defmodule PingPongTest do
  use ExUnit.Case
  doctest PingPong

  test "returns {:pong, node()} when ping is called" do
    {:ok, _pid} = PingPong.start_link()

    assert PingPong.ping() == {:pong, node()}
  end
end
