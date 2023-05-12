defmodule AppAlumno.CursosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AppAlumno.Cursos` context.
  """

  @doc """
  Generate a curso.
  """
  def curso_fixture(attrs \\ %{}) do
    {:ok, curso} =
      attrs
      |> Enum.into(%{
        codcurso: "some codcurso",
        fechafin: ~D[2023-05-10],
        fechaini: ~D[2023-05-10],
        nomcurso: "some nomcurso",
        nota: 42
      })
      |> AppAlumno.Cursos.create_curso()

    curso
  end
end
