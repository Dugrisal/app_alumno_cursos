defmodule AppAlumnoWeb.AlumnoController do
  use AppAlumnoWeb, :controller

  alias AppAlumno.Alumnos
  alias AppAlumno.Alumnos.Alumno

  action_fallback AppAlumnoWeb.FallbackController

  def index(conn, _params) do
    alumnos = Alumnos.list_alumnos()
    #render(conn, "index.json", alumnos: alumnos)
    render(conn, :index, alumnos: alumnos)
  end

  def create(conn, %{"alumno" => alumno_params}) do
    with {:ok, %Alumno{} = alumno} <- Alumnos.create_alumno(alumno_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.alumno_path(conn, :show, alumno))
     # |> render("show.json", alumno: alumno)
      |> render(:show, alumno: alumno)
    end
  end

  def show(conn, %{"id" => id}) do
    alumno = Alumnos.get_alumno!(id)
    #render(conn, "show.json", alumno: alumno)
    render(conn, :show, alumno: alumno)
  end

  def update(conn, %{"id" => id, "alumno" => alumno_params}) do
    alumno = Alumnos.get_alumno!(id)

    with {:ok, %Alumno{} = alumno} <- Alumnos.update_alumno(alumno, alumno_params) do
      render(conn, "show.json", alumno: alumno)
    end
  end

  def delete(conn, %{"id" => id}) do
    alumno = Alumnos.get_alumno!(id)

    with {:ok, %Alumno{}} <- Alumnos.delete_alumno(alumno) do
      send_resp(conn, :no_content, "")
    end
  end

  def filter_for_name(conn, %{"nombre" => name}) do
    IO.puts("controlador")
    alumnos = Alumnos.filter_for_name(String.trim(name))
    IO.inspect(alumnos)
    render(conn, :index, alumnos: alumnos)
  end


end
