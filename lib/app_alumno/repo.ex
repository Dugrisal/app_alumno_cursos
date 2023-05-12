defmodule AppAlumno.Repo do
  use Ecto.Repo,
    otp_app: :app_alumno,
    adapter: Ecto.Adapters.Postgres
end
