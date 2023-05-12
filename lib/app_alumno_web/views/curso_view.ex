defmodule AppAlumnoWeb.CursoView do
  use AppAlumnoWeb, :view
  alias AppAlumnoWeb.CursoView

  def render("index.json", %{cursos: cursos}) do
    %{data: render_many(cursos, CursoView, "curso.json")}
  end

  def render("show.json", %{curso: curso}) do
    %{data: render_one(curso, CursoView, "curso.json")}
  end

  def render("curso.json", %{curso: curso}) do
    #Bring the alumno
    IO.puts("render")
    IO.inspect(curso)
#    alumno = [curso.alumno]
#             |> Enum.map(& Map.from_struct(&1))
#             |> Enum.map(& Enum.reduce([:__meta__, :cursos, :inserted_at, :updated_at], &1, fn key, val ->
#                Map.delete(val, key) end))
#             |> List.first
    %{
      id: curso.id,
      codcurso: curso.codcurso,
      nomcurso: curso.nomcurso,
      nota: curso.nota,
      fechafin: curso.fechafin,
      fechaini: curso.fechaini,
      #alumno: alumno
    }
  end
end
