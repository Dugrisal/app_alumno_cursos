defmodule AppAlumnoWeb.Router do
  alias AppAlumnoWeb.AlumnoController
  alias AppAlumnoWeb.CursoController
  use AppAlumnoWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    resources "/alumnos", AlumnoController, except: [:edit, :new, :update]
    put "/alumnos/mix phx.server :id", AlumnoController, :update

    resources "/cursos", CursoController, except: [:edit, :new, :update]
    put "/cursos/:id", CursoController, :update

    #filtrar cursos con nota >=
    get "/cursos/notas/:nota", CursoController, :filter_note_cursos

    #filtrar cursos con fecha between

    get "/cursos/fecha/:fecha", CursoController, :filter_fecha_cursos

    #filtrar for name
    get "/alumnos/nombre/:nombre", AlumnoController, :filter_for_name

  end
end
