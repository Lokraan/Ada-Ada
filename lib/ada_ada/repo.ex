defmodule AdaAda.Repo do
  use Ecto.Repo,
    otp_app: :ada_ada,
    adapter: Ecto.Adapters.Postgres

  import Ecto.Query, 
    only: [
      from: 2
    ]

  alias AdaAda.{Ada, Repo, User}

  @page_size 25

  def get_all_users(opts \\ {}) do
    User
    |> paginate(1, @page_size)
    |> Repo.all()
  end

  defp paginate(query, page, size) do
    from query,
      limit: ^size,
      offset: ^((page-1) * size)
  end
end
