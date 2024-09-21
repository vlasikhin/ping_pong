defmodule PingPong do
  use GenServer

  @moduledoc """
  A simple echo server implemented using `GenServer`. This module responds to a `:ping`
  message with a tuple `{:pong, node()}`, where `node()` represents the current node.

  # Usage

  To start the GenServer send a ping and receive a pong:
      iex> {:ok, _pid} = PingPong.start_link()
      iex> PingPong.ping()
      {:pong, node()}
  """

  def start_link() do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def ping() do
    GenServer.call(__MODULE__, :ping)
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call(:ping, _from, state) do
    {:reply, {:pong, node()}, state}
  end
end
