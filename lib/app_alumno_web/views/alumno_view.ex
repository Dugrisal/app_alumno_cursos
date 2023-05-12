defmodule AppAlumnoWeb.AlumnoView do
  use AppAlumnoWeb, :view
  alias AppAlumnoWeb.AlumnoView

  def render("index.json", %{alumnos: alumnos}) do
    %{data: render_many(alumnos, AlumnoView, "alumno.json")}
  end

  def render("show.json", %{alumno: alumno}) do
    %{data: render_one(alumno, AlumnoView, "alumno.json")}
  end

  def render("alumno.json", %{alumno: alumno}) do
    #Bring the curso
    IO.puts("render")
    IO.inspect(alumno)
    cursos = alumno.cursos
             |> Enum.map(& Map.from_struct(&1))
             |> Enum.map(& Enum.reduce([:__meta__, :alumno, :alumno_id, :inserted_at, :updated_at], &1, fn key, val ->
                Map.delete(val, key) end))
    IO.inspect(cursos)
    %{
      id: alumno.id,
      id_alumno: alumno.id_alumno,
      nombre: alumno.nombre,
      apellido: alumno.apellido,
      email: alumno.email,
      telefono: alumno.telefono,
      cursos: cursos
    }
  end
end
