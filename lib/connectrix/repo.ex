defmodule Connectrix.Repo do
  use Ecto.Repo,
    otp_app: :connectrix,
    adapter: Ecto.Adapters.Postgres
end
