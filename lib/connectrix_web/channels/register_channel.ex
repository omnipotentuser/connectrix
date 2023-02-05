defmodule ConnectrixWeb.RegisterChannel do
  use Phoenix.Channel

  def join("register:" <> extension, _payload, socket) do
    if is_registered?(extension) do
      {:ok, socket}
    else
      {:error, %{}}
    end
  end

  def handle_in("call", payload, socket) do
    IO.inspect(payload, label: "PAYLOAD")
    {:reply, {:ok, %{call: "Nick"}}, socket}
  end

  defp is_registered?("Nick"), do: true
  defp is_registered?(_extension), do: false
end
