defmodule PingPong do
  use GenServer

  @moduledoc """
  A simple echo server implemented using `GenServer`. This module responds to a `:ping`
  message with `:pong`.

  # Usage

  To start the GenServer send a ping and receive a pong:
      iex> {:ok, _pid} = PingPong.start_link()
      iex> PingPong.ping()
      :pong
  """

  def start_link do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def ping do
    GenServer.call(__MODULE__, :ping)
  end

  @impl true
  def init(_) do
    {:ok, nil}
  end

  @impl true
  def handle_call(:ping, _from, state) do
    {:reply, :pong, state}
  end
end
