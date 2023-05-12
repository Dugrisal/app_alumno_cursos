defmodule AppAlumno.Repo.Migrations.CreateAlumnos do
  use Ecto.Migration

  def change do
    create table(:alumnos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :id_alumno, :string
      add :nombre, :string
      add :apellido, :string
      add :email, :string
      add :telefono, :string

      timestamps()
    end
    create unique_index(:alumnos, [:id_alumno])
  end
end
