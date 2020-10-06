defmodule ServicesApi.Repo do
  use Ecto.Repo,
    otp_app: :services_api,
    adapter: Ecto.Adapters.Postgres
end
