defmodule AppAlumno.Alumnos.Alumno do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "alumnos" do
    field :id_alumno, :string
    field :nombre, :string
    field :apellido, :string
    field :email, :string
    field :telefono, :string
    has_many :cursos, AppAlumno.Cursos.Curso
    timestamps()
  end

  @doc false
  def changeset(alumno, attrs) do
    alumno
    |> cast(attrs, [:id_alumno, :nombre, :apellido, :email, :telefono])
    |> validate_required([:id_alumno, :nombre, :apellido, :email, :telefono])
    |> validate_length(:id_alumno, max: 10, message: "Lenght id alumno invalid")
    |> unique_constraint(:id_alumno, message: "Id_alumno already exists")
  end
end
