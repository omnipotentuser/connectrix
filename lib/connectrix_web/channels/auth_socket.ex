defmodule ConnectrixWeb.AuthSocket do
  use Phoenix.Socket
  require Logger

  channel "ping", ConnectrixWeb.PingChannel
  channel "register:*", ConnectrixWeb.RegisterChannel

  @one_day 86400

  @spec connect(%{bitstring() => bitstring()}, Phoenix.Socket.t()) ::
          :error | {:ok, Phoenix.Socket.t()}
  def connect(%{"token" => token}, socket) do
    case verify(socket, token) do
      {:ok, user_id} ->
        socket = assign(socket, :user_id, user_id)
        {:ok, socket}

      {:error, err} ->
        Logger.error("#{__MODULE__} connect error #{inspect(err)}")
        :error
    end
  end

  def connect(_, _socket) do
    Logger.error("#{__MODULE__} connect error missing params")
    :error
  end

  @spec id(%{:assigns => %{:user_id => any, optional(any) => any}, optional(any) => any}) ::
          <<_::64, _::_*8>>
  def id(%{assigns: %{user_id: user_id}}), do: "auth_socket:#{user_id}"

  defp verify(socket, token) do
    Phoenix.Token.verify(
      socket,
      "salt identifier",
      token,
      max_age: @one_day
    )
  end
end
