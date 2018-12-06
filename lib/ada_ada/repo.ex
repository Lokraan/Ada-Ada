defmodule AdaAda.Repo do
  use Ecto.Repo,
    otp_app: :ada_ada,
    adapter: Ecto.Adapters.Postgres
end
