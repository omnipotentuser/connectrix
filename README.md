# Connectrix

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Environment
create a .env file at the root dir of the project. You will need to generate secret for the Endpoint, so before running your project, be sure to set the environment.

`. ./.env` # with 'export ENDPOINT_SECRET=<yoursecret> inside, for example'

create token for testing
`iex(6)> Phoenix.Token.sign(ConnectrixWeb.Endpoint, "salt identifier", "nick")`

Need to first install wscat
`apt get install npm && npm install -g wscat`
`wscat -c 'ws://localhost:4000/auth_socket/websocket?vsn=2.0.0&token=SFMyNTY.g2gDYQFuBgBd9_5zhAFiAAFRgA.gqRJwv7u8I4MZBAWlQWrQt9G5ccwqHfgem-SYsK_ZNk'`