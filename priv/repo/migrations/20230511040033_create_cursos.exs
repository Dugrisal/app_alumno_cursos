defmodule AppAlumno.Repo.Migrations.CreateCursos do
  use Ecto.Migration

  def change do
    create table(:cursos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :codcurso, :string
      add :nomcurso, :string
      add :nota, :integer
      add :fechaini, :date
      add :fechafin, :date
      add :alumno_id, references(:alumnos, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:cursos, [:alumno_id, :codcurso])
    create index(:cursos, [:alumno_id])
  end
end
