defmodule AppAlumno.Cursos.Curso do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "cursos" do
    field :codcurso, :string
    field :nomcurso, :string
    field :nota, :integer
    field :fechafin, :date
    field :fechaini, :date
    #field :alumno_id, :binary_id
    belongs_to :alumno, AppAlumno.Alumnos.Alumno
    timestamps()
  end

  @doc false
  def changeset(curso, attrs) do
    curso
    |> cast(attrs, [:codcurso, :nomcurso, :nota, :fechaini, :fechafin, :alumno_id])
    |> validate_required([:codcurso, :nomcurso, :nota, :fechaini, :fechafin])
    |> unique_constraint(:codcurso, message: "codigo curso already exists")
  end
end
