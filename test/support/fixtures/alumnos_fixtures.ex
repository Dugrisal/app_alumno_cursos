defmodule AppAlumno.AlumnosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `AppAlumno.Alumnos` context.
  """

  @doc """
  Generate a alumno.
  """
  def alumno_fixture(attrs \\ %{}) do
    {:ok, alumno} =
      attrs
      |> Enum.into(%{
        apellido: "some apellido",
        email: "some email",
        id_alumno: "some id_alumno",
        nombre: "some nombre",
        telefono: "some telefono"
      })
      |> AppAlumno.Alumnos.create_alumno()

    alumno
  end
end
