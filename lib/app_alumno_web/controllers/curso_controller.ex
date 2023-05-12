defmodule AppAlumnoWeb.CursoController do
  use AppAlumnoWeb, :controller

  alias AppAlumno.Cursos
  alias AppAlumno.Cursos.Curso
  #alias AppAlumno.Alumnos

  action_fallback AppAlumnoWeb.FallbackController

  def index(conn, _params) do
    cursos = Cursos.list_cursos()
    #render(conn, "index.json", cursos: cursos)
    render(conn, :index, cursos: cursos)
  end

  def create(conn, %{"curso" => curso_params}) do
    with {:ok, %Curso{} = curso} <- Cursos.create_curso(curso_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.curso_path(conn, :show, curso))
      #|> put_resp_header("location", ~p"/api/cursos/#{curso}")
      #|> render("show.json", curso: curso)
      |> render(:show, curso: curso)
    end
  end

  def show(conn, %{"id" => id}) do
    curso = Cursos.get_curso!(id)
    render(conn, "show.json", curso: curso)
    #render(conn, :show, curso: curso)
  end

  def update(conn, %{"id" => id, "curso" => curso_params}) do
    curso = Cursos.get_curso!(id)

    with {:ok, %Curso{} = curso} <- Cursos.update_curso(curso, curso_params) do
      render(conn, "show.json", curso: curso)
    end
  end

  def delete(conn, %{"id" => id}) do
    curso = Cursos.get_curso!(id)

    with {:ok, %Curso{}} <- Cursos.delete_curso(curso) do
      send_resp(conn, :no_content, "")
    end
  end

  def filter_note_cursos(conn, %{"nota" => nota}) do
    curso = Cursos.filter_note_cursos(String.to_integer(nota))
    render(conn, :index, cursos: curso)
  end

  def filter_fecha_cursos(conn, %{"fecha" => fecha}) do

    curso = Cursos.filter_fecha_cursos(fecha)
    render(conn, :index, cursos: curso)
  end


end
